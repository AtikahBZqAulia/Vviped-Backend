
<?php

require_once 'DbConnect.php';
//array to show the response
$response = array();

//uploads directory, we will upload all the files inside this folder
$target_dir = "uploads/";

//checking if we are having an api call, using the get parameters 'apicall'
if (isset($_GET['apicall'])) {

    switch ($_GET['apicall']) {

            //if the api call is for uploading the image 
        case 'upload':
            //error message and error flag
            $message = 'Params ';
            $is_error = false;

            //validating the request to check if all the required parameters are available or not 

            if (!isset($_FILES['image']['name'])) {
                $message .= "image ";
                $is_error = true;
            }

            if (!isset($_POST['product_price'])) {
                $message .= "product_price, ";
                $is_error = true;
            }
            if (!isset($_POST['product_name'])) {
                $message .= "product_name, ";
                $is_error = true;
            }
            if (!isset($_POST['product_desc'])) {
                $message .= "product_desc, ";
                $is_error = true;
            }
            if (!isset($_POST['seller_loc'])) {
                $message .= "seller_loc, ";
                $is_error = true;
            }


            //in case we have an error in validation, displaying the error message 
            if ($is_error) {
                $response['error'] = true;
                $response['message'] = $message . " required.";
            } else {
                //if validation succeeds 
                //creating a target file with a unique name, so that for every upload we create a unique file in our server
                $target_file = $target_dir . uniqid() . '.' . pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);

                //saving the uploaded file to the uploads directory in our target file
                if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {

                    $stmt = $conn->prepare("INSERT INTO selling_posts (`path`, `product_price`, `product_name`, `product_desc`, `seller_loc`) VALUES (?, ?, ?, ?, ?)");
                    $stmt->bind_param("sssss", $target_file, $_POST['product_price'], $_POST['product_name'], $_POST['product_desc'], $_POST['seller_loc']);

                    if ($stmt->execute()) {
                        $response['error'] = false;
                        $response['message'] = 'Image Uploaded Successfully';
                        $response['image'] = getBaseURL() . $target_file;
                        $response['product_price'] = $_POST['product_price'];
                        $response['product_name'] = $_POST['product_name'];
                        $response['product_desc'] = $_POST['product_desc'];
                        $response['seller_loc'] = $_POST['seller_loc'];
                    } else {
                        $response['error'] = true;
                        $response['message'] = 'Could not upload image, try again...';
                    }
                } else {
                    $response['error'] = true;
                    $response['message'] = 'Try again later...';
                }
            }
            break;

        case 'images':
            $stmt = $conn->prepare("SELECT `id`, `path`, `product_price`, `product_name`, `product_desc`, `seller_loc` FROM selling_posts");
            $stmt->execute();
            $stmt->bind_result($id, $path, $product_price, $product_name, $product_desc, $seller_loc);

            while ($stmt->fetch()) {
                $image = array();
                $image['id'] = $id;
                $image['path'] = getBaseURL() . $path;
                $image['product_price'] = $product_price;
                $image['product_name'] = $product_name;
                $image['product_desc'] = $product_desc;
                $image['seller_loc'] = $seller_loc;
                array_push($response, $image);
            }

            break;


        default:
            $response['error'] = true;
            $response['message'] = 'Invalid Operation Called';
    }
} else {
    $response['error'] = true;
    $response['message'] = 'Invalid API Call';
}

function getBaseURL()
{
    $url  = isset($_SERVER['HTTPS']) ? 'https://' : 'http://';
    $url .= $_SERVER['SERVER_NAME'];
    $url .= $_SERVER['REQUEST_URI'];
    return dirname($url) . '/';
}


header('Content-Type: application/json');
echo json_encode($response);
