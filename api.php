
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
            if (!isset($_POST['product_condition'])) {
                $message .= "product_condition, ";
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
            if (!isset($_POST['selling_status'])) {
                $message .= "selling_status, ";
                $is_error = true;
            }
            if (!isset($_POST['whatsapp'])) {
                $message .= "whatsapp number, ";
                $is_error = true;
            }
            if (!isset($_POST['user_id'])) {
                $message .= "user_id, ";
                $is_error = true;
            }
            if (!isset($_POST['campaign_id'])) {
                $message .= "campaign_id, ";
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

                    $stmt = $conn->prepare("INSERT INTO selling_posts (`path`, `product_price`, `product_name`, `product_condition`, `product_desc`, `seller_loc`, `selling_status`, `whatsapp`, `user_id`, `campaign_id`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
                    $stmt->bind_param("ssssssssss", $target_file, $_POST['product_price'], $_POST['product_name'], $_POST['product_condition'], $_POST['product_desc'], $_POST['seller_loc'], $_POST['selling_status'], $_POST['whatsapp'], $_POST['user_id'], $_POST['campaign_id']);

                    if ($stmt->execute()) {
                        $response['error'] = false;
                        $response['message'] = 'Product Uploaded Successfully';
                        $response['image'] = getBaseURL() . $target_file;
                        $response['product_price'] = $_POST['product_price'];
                        $response['product_name'] = $_POST['product_name'];
                        $response['product_condition'] = $_POST['product_condition'];
                        $response['product_desc'] = $_POST['product_desc'];
                        $response['seller_loc'] = $_POST['seller_loc'];
                        $response['selling_status'] = $_POST['selling_status'];
                        $response['whatsapp'] = $_POST['whatsapp'];
                        $response['user_id'] = $_POST['user_id'];
                        $response['campaign_id'] = $_POST['campaign_id'];
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

        case 'uploadCampaign':
            //error message and error flag
            $message = 'Params ';
            $is_error = false;

            //validating the request to check if all the required parameters are available or not 

            if (!isset($_FILES['image']['name'])) {
                $message .= "image ";
                $is_error = true;
            }

            if (!isset($_POST['campaign_category'])) {
                $message .= "campaign_category, ";
                $is_error = true;
            }
            if (!isset($_POST['campaign_title'])) {
                $message .= "campaign_title, ";
                $is_error = true;
            }
            if (!isset($_POST['campaign_desc'])) {
                $message .= "campaign_desc, ";
                $is_error = true;
            }
            if (!isset($_POST['donation_goes'])) {
                $message .= "donation_goes, ";
                $is_error = true;
            }
            if (!isset($_POST['usage_details'])) {
                $message .= "usage_details, ";
                $is_error = true;
            }
            if (!isset($_POST['phone_number'])) {
                $message .= "phone_number, ";
                $is_error = true;
            }
            if (!isset($_POST['user_id'])) {
                $message .= "user_id, ";
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

                    $stmt = $conn->prepare("INSERT INTO campaign_list (`path`, `campaign_category`, `campaign_title`, `campaign_desc`, `campaign_receiver`, `usage_details`, `phone_campaign`, `user_id`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
                    $stmt->bind_param("ssssssss", $target_file, $_POST['campaign_category'], $_POST['campaign_title'], $_POST['campaign_desc'], $_POST['donation_goes'], $_POST['usage_details'], $_POST['phone_number'], $_POST['user_id']);

                    if ($stmt->execute()) {
                        $response['error'] = false;
                        $response['message'] = 'Campaign Uploaded Successfully';
                        $response['image'] = getBaseURL() . $target_file;
                        $response['campaign_category'] = $_POST['campaign_category'];
                        $response['campaign_title'] = $_POST['campaign_title'];
                        $response['campaign_desc'] = $_POST['campaign_desc'];
                        $response['donation_goes'] = $_POST['donation_goes'];
                        $response['usage_details'] = $_POST['usage_details'];
                        $response['phone_number'] = $_POST['phone_number'];
                        $response['user_id'] = $_POST['user_id'];
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

        case 'sellingproducts':
            //$stmt = $conn->prepare("SELECT `id_product`, `path_product`, `product_price`, `product_name`, `product_condition`, `product_desc`, `seller_loc`, `selling_status`, `user_id`, `username`, `fullname`, `email` FROM VIEW_SELLINGPRODUCT");
            //$stmt->execute();
            //$stmt->bind_result($id, $path, $product_price, $product_name, $product_condition, $product_desc, $seller_loc, $selling_status, $user_id, $username, $fullname, $email);z
            $stmt = "SELECT * FROM VIEW_SELLINGPOSTS ORDER BY id DESC";
            $read = mysqli_query($conn, $stmt);
            //$row = mysqli_fetch_array($read);

            while ($row = mysqli_fetch_array($read)) {

                $image = array();
                $image['id'] = $row["id"];
                $image['path'] = getBaseURL() . $row["path"];
                $image['product_price'] = $row["product_price"];
                $image['product_name'] = $row["product_name"];
                $image['product_condition'] = $row["product_condition"];
                $image['product_desc'] = $row["product_desc"];
                $image['seller_loc'] = $row["seller_loc"];
                $image['selling_status'] = $row["selling_status"];
                $image['whatsapp'] = $row["whatsapp"];
                $image['user_id'] = $row["user_id"];
                $image['email'] = $row["email"];
                $image['fullname'] = $row["fullname"];
                $image['username'] = $row["username"];
                $image['user_profpict'] = getBaseURL() . $row["user_profpic"];
                $image['campaign_id'] = $row["campaign_id"];
                $image['campaign_title'] = $row["campaign_title"];


                array_push($response, $image);
            }

            break;

        case 'campaigns':
            //$stmt = $conn->prepare("SELECT `id`, `path`, `campaign_category`, `campaign_title`, `campaign_desc`, `campaign_receiver`, `usage_details`, `phone_campaign` FROM campaign_list");
            //$stmt->execute();
            //$stmt->bind_result($id, $path, $campaign_category, $campaign_title, $campaign_desc, $donation_goes, $usage_details, $phone_number);

            $stmt = "SELECT * FROM VIEW_CAMPAIGNLIST ORDER BY id DESC";
            $read = mysqli_query($conn, $stmt);
            //$row = mysqli_fetch_array($read);


            while ($row = mysqli_fetch_array($read)) {
                $image = array();
                $image['id'] = $row["id"];
                $image['path'] = getBaseURL() . $row["path"];
                $image['campaign_category'] = $row["campaign_category"];
                $image['campaign_title'] = $row["campaign_title"];
                $image['campaign_desc'] = $row["campaign_desc"];
                $image['campaign_receiver'] = $row["campaign_receiver"];
                $image['usage_details'] = $row["usage_details"];
                $image['phone_campaign'] = $row["phone_campaign"];
                $image['user_id'] = $row["user_id"];
                $image['username'] = $row["username"];
                $image['fullname'] = $row["fullname"];
                $image['email'] = $row["email"];
                $image['user_profpic'] = getBaseURL() . $row["user_profpic"];
                array_push($response, $image);
            }
            break;


        case 'register':
            //error message and error flag
            $message = 'Params ';
            $is_error = false;

            $email = $_POST['email'];
            $username = $_POST['username'];
            $password = $_POST['password'];
            $password_hashed = password_hash($_POST['password'], PASSWORD_DEFAULT);
            $user_propic = $_POST['user_profpic'];
            // $password_hashed = md5($_POST['password']);


            //validating the request to check if all the required parameters are available or not 
            if (!isset($_POST['email'])) {
                $message .= "email, ";
                $is_error = true;
            }
            if (!isset($_POST['fullname'])) {
                $message .= "fullname, ";
                $is_error = true;
            }
            if (!isset($_POST['username'])) {
                $message .= "username, ";
                $is_error = true;
            }
            if (!isset($password)) {
                $message .= "password, ";
                $is_error = true;
            }

            //in case we have an error in validation, displaying the error message 
            if ($is_error) {
                $response['error'] = true;
                $response['message'] = $message . " required.";
            } else {

                $checkEmail = "SELECT * FROM user WHERE email = '$email' OR username = '$username'";
                $check = mysqli_fetch_array(mysqli_query($conn, $checkEmail));

                if (isset($check)) {
                    $response['error'] = true;
                    $response['message'] = 'Email/username already exist!';
                    die;
                }


                $stmt = $conn->prepare("INSERT INTO user (`email`, `fullname`, `username`, `password`, `user_profpic`) VALUES (?, ?, ?, ?, ?)");
                // $stmt->bind_param("ssss", $_POST['email'], $_POST['fullname'], $_POST['username'], $password, );

                $stmt->bind_param("sssss", $_POST['email'], $_POST['fullname'], $_POST['username'], $password_hashed, $_POST['user_profpic']);
                
                $id = $stmt->insert_id;

                if ($stmt->execute()) {
                    $response['error'] = false;
                    $response['message'] = 'Register Success!';
                    $response['id'] = $stmt->insert_id;
                    $response['user_profpic'] = $image['user_profpic'];
                    $response['email'] = $_POST['email'];
                    $response['fullname'] = $_POST['fullname'];
                    $response['username'] = $_POST['username'];
                    $response['user_profpic'] = $_POST['user_profpic'];
                    $response['password'] = $password;
                    $response['password'] = $password_hashed;
                } else {
                    $response['error'] = true;
                    $response['message'] = 'Could not register, try again...';
                }

                $stmtn = "SELECT * FROM user";
                $read = mysqli_query($conn, $stmtn);
                $row = mysqli_fetch_array($read);

                while ($row = mysqli_fetch_array($read)) {

                    $image = array();
                    $image['id'] = $row["id"];
                    $image['email'] = $row["email"];
                    $image['fullname'] = $row["fullname"];
                    $image['username'] = $row["username"];
                    $image['password'] = $row["password"];
                    $image['user_profpic'] = getBaseURL() . $row["user_profpic"];
                    array_push($response, $image);
                }
            }
            break;
            
        case 'sellingpost_profile':
            //error message and error flag

            $user_id = $_POST['user_id'];

            //validating the request to check if all the required parameters are available or not 
            if (!isset($_POST['user_id'])) {
                $message .= "user_id, ";
                $is_error = true;
            }
            //in case we have an error in validation, displaying the error message 
            if ($is_error) {
                $response['error'] = true;
                $response['message'] = $message . " required.";
            } else {
                //if validation succeeds 
                $stmt = "SELECT * FROM VIEW_SELLINGPOSTS WHERE user_id = $user_id ORDER BY id DESC";
                $read = mysqli_query($conn, $stmt);
                //$row = mysqli_fetch_array($read);

                while ($row = mysqli_fetch_array($read)) {

                    $image = array();
                    $image['id'] = $row["id"];
                    $image['path'] = getBaseURL() . $row["path"];
                    $image['product_price'] = $row["product_price"];
                    $image['product_name'] = $row["product_name"];
                    $image['product_condition'] = $row["product_condition"];
                    $image['product_desc'] = $row["product_desc"];
                    $image['seller_loc'] = $row["seller_loc"];
                    $image['selling_status'] = $row["selling_status"];
                    $image['whatsapp'] = $row["whatsapp"];
                    $image['user_id'] = $row["user_id"];
                    $image['email'] = $row["email"];
                    $image['fullname'] = $row["fullname"];
                    $image['username'] = $row["username"];
                    $image['user_profpict'] = getBaseURL() . $row["user_profpic"];
                    $image['campaign_id'] = $row["campaign_id"];
                    $image['campaign_title'] = $row["campaign_title"];


                    array_push($response, $image);
                }
            }
            break;
            
            case 'campaignpost_profile':
            //error message and error flag

            $user_id = $_POST['user_id'];

            //validating the request to check if all the required parameters are available or not 
            if (!isset($_POST['user_id'])) {
                $message .= "user_id, ";
                $is_error = true;
            }
            //in case we have an error in validation, displaying the error message 
            if ($is_error) {
                $response['error'] = true;
                $response['message'] = $message . " required.";
            } else {
                //if validation succeeds 
                $stmt = "SELECT * FROM VIEW_CAMPAIGNLIST WHERE user_id = $user_id ORDER BY id DESC";
                $read = mysqli_query($conn, $stmt);
                //$row = mysqli_fetch_array($read);

                while ($row = mysqli_fetch_array($read)) {

                    $image = array();
                    $image['id'] = $row["id"];
                    $image['path'] = getBaseURL() . $row["path"];
                    $image['campaign_category'] = $row["campaign_category"];
                    $image['campaign_title'] = $row["campaign_title"];
                    $image['campaign_desc'] = $row["campaign_desc"];
                    $image['campaign_receiver'] = $row["campaign_receiver"];
                    $image['usage_details'] = $row["usage_details"];
                    $image['phone_campaign'] = $row["phone_campaign"];
                    $image['user_id'] = $row["user_id"];
                    $image['username'] = $row["username"];
                    $image['fullname'] = $row["fullname"];
                    $image['email'] = $row["email"];
                    $image['user_profpic'] = getBaseURL() . $row["user_profpic"];
                    array_push($response, $image);
                }
            }
            break;

            case 'delete_sellingpost':
                $message = 'Params ';
                $is_error = false;

                $id = $_POST['id'];

                if (!isset($_POST['id'])) {
                    $message .= "id, ";
                    $is_error = true;
                }
                if ($is_error) {
                    $response['error'] = true;
                    $response['message'] = $message . " required.";
                }

                else {

                    $stmt = "DELETE FROM selling_posts WHERE id = $id";
                    $read = mysqli_query($conn, $stmt);

                    if ($row = mysqli_fetch_array($read)) {
                        $response['error'] = false;
                        $response['message'] = "berhasil hapus product";
                           
                    }
            }
             
                break;


                case 'delete_campaignpost':
                    $message = 'Params ';
                    $is_error = false;
    
                    $id = $_POST['id'];
    
                    if (!isset($_POST['id'])) {
                        $message .= "id, ";
                        $is_error = true;
                    }
                    if ($is_error) {
                        $response['error'] = true;
                        $response['message'] = $message . " required.";
                    }
    
                    else {
    
                        $stmt = "DELETE FROM campaign_list WHERE id = $id";
                        $read = mysqli_query($conn, $stmt);
    
                        if ($row = mysqli_fetch_array($read)) {
                            $response['error'] = false;
                            $response['message'] = "berhasil hapus campaign";
                               
                        }
                }
                 
                    break;
            
            case 'editproduct':
            //error message and error flag

            $id = $_POST['id'];
            $product_price = $_POST['product_price'];
            $product_name = $_POST['product_name'];
            $product_desc = $_POST['product_desc'];
            $seller_loc = $_POST['seller_loc'];
            $whatsapp = $_POST['whatsapp'];
            

            //validating the request to check if all the required parameters are available or not 
            if (!isset($_POST['id'])) {
                $message .= "id, ";
                $is_error = true;
            }

            //in case we have an error in validation, displaying the error message 
            if ($is_error) {
                $response['error'] = true;
                $response['message'] = $message . " required.";
            } else {
                $stmt = "UPDATE selling_posts SET product_price = COALESCE('$product_price', product_price), product_name = COALESCE('$product_name', product_name), product_desc = COALESCE('$product_desc', product_desc), seller_loc = COALESCE('$seller_loc', seller_loc), whatsapp = COALESCE('$whatsapp', whatsapp) WHERE id=$id";
                mysqli_query($conn, $stmt);
                $profpic = "SELECT * FROM user WHERE id=$id";
                $read_user = mysqli_query($conn, $profpic);
                $row = mysqli_fetch_array($read_user);
                $response['message'] = 'Selling Post Updated!';
                $response['id'] = $row['id'];
                $response['product_name'] = $row['product_name'];
                $response['product_price'] = $row['product_price'];
                $response['product_desc'] = $row['product_desc'];
                $response['seller_loc'] = $row['seller_loc'];
                $response['whatsapp'] = $row['whatsapp'];
                
            }
            break;
            
            
            case 'edituser':
            //error message and error flag
            
            $target_folder = "profpic/";
            $profpic = $_FILES['image']['name'];

            $user_id = $_POST['user_id'];
            $fullname = $_POST['fullname'];
            $username = $_POST['username'];

            //validating the request to check if all the required parameters are available or not 
            if (!isset($_POST['user_id'])) {
                $message .= "user_id, ";
                $is_error = true;
            }

            //in case we have an error in validation, displaying the error message 
            if ($is_error) {
                $response['error'] = true;
                $response['message'] = $message . " required.";
            } else {
                if($_FILES['image']['name'] == null) {
                    $stmt = "UPDATE user SET fullname = COALESCE('$fullname', fullname), username = COALESCE('$username', username)  WHERE id=$user_id";
                    mysqli_query($conn, $stmt);
                    $profpic = "SELECT * FROM user WHERE id=$user_id";
                    $read_user = mysqli_query($conn, $profpic);
                    $row = mysqli_fetch_array($read_user);
                    $response['message'] = 'Profile Updated!';
                    $response['fullname'] = $row['fullname'];
                    $response['username'] = $row['username'];
                    $response['profpic'] = getBaseURL() . $row['user_profpic'];
                    
                }
                elseif($_FILES['image']['name'] != null) {
                    $target_file = $target_dir . uniqid() . '.' . pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);

                //saving the uploaded file to the uploads directory in our target file
                    if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
                        $stmt = "UPDATE user SET fullname = COALESCE('$fullname', fullname), username = COALESCE('$username', username), user_profpic = COALESCE('$target_file', user_profpic)  WHERE id=$user_id";
                        mysqli_query($conn, $stmt);
                        $profpic = "SELECT * FROM user WHERE id=$user_id";
                        $read_user = mysqli_query($conn, $profpic);
                        $row = mysqli_fetch_array($read_user);
                        $response['message'] = 'Profile Updated!';
                        $response['fullname'] = $row['fullname'];
                        $response['username'] = $row['username'];
                        $response['profpic'] = getBaseURL() . $row['user_profpic'];
                        //$row = mysqli_fetch_array($read);
                    
                    }
                }
            }
            break;
            
            case 'useractivities':
            //error message and error flag
            $user_id = $_POST['user_id'];
            $username = trim($_POST['username'],'"');;
            $activity = $_POST['activity'];
            $datetime = date('Y-m-d H:i:s');

            //validating the request to check if all the required parameters are available or not 


            //in case we have an error in validation, displaying the error message 
            if ($is_error) {
                $response['error'] = true;
                $response['message'] = $message . " required.";
            } else {
                $stmt = $conn->prepare("INSERT INTO logging (`user_id`, `username`, `activity`, `datetime`) VALUES (?, ?, ?, ?)");
                $stmt->bind_param("ssss", $user_id, $username, $activity, $datetime);
                
                if ($stmt->execute()) {
                    $response['error'] = false;
                    $response['message'] = 'Success';
                    $response['user_id'] = $user_id;
                    $response['username'] = $username;
                    $response['activity'] = $activity;
                    $response['datetime'] = $datetime;
                    } 
                    else {
                        $response['error'] = true;
                        $response['message'] = 'Please try again';
                        
                    }
                        
            }
            break;
            
           case 'showLogging':

            $stmt = "SELECT * FROM logging ORDER BY id DESC";
            $read = mysqli_query($conn, $stmt);

            while ($row = mysqli_fetch_array($read)) {
                $show = array();
                $show['id'] = $row["id"];
                $show['user_id'] = $row["user_id"];
                $show['username'] = $row["username"];
                $show['activity'] = $row["activity"];
                $show['datetime'] = $row["datetime"];
                array_push($response, $show);
            }

            break;


        case 'login':
            //error message and error flag
            $message = 'Params ';
            $is_error = false;
            $response = [];

            $username = $_POST['username'];
            $password = $_POST['password'];

            //validating the request to check if all the required parameters are available or not 
            if (!isset($_POST['username'])) {
                $message .= "username, ";
                $is_error = true;
            }
            if (!isset($_POST['password'])) {
                $message .= "password, ";
                $is_error = true;
            }
            //in case we have an error in validation, displaying the error message 
            if ($is_error) {
                $response['error'] = true;
                $response['message'] = $message . " required.";
            } else {
                //if validation succeeds 

                $stmt = $conn->prepare("SELECT `id`, `email`, `fullname`, `username`, `password`, `user_profpic` FROM user WHERE username = '$username'");
                $stmt->execute();

                $stmt->bind_result($id, $email, $fullname, $username, $password, $user_profpic);

                if ($stmt->execute()) {
                    while ($stmt->fetch()) {
                        if (password_verify($_POST['password'], $password)) {
                            //password correct
                            $response['status'] = true;
                            $response['message'] = 'Password correct.';
                            $response['data'] = [
                                'id' => $id,
                                'email' => $email,
                                'fullname' => $fullname,
                                'username' => $username,
                                'user_profpic' => getBaseURL() . $user_profpic,

                                // $user['hashpassword'] = $password;
                            ];
                        } else {
                            $response['status'] = false;
                            $response['message'] = 'Wrong Password!';
                        }
                    }
                } else {
                    array_push($response, array(
                        'status' => false,
                        'message' => "Login failed",
                    ));
                }
            }
            break;


        case 'uploadProfpic':

            $target_dir = "profpic/";

            $target_file = $target_dir . uniqid() . '.' . pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);

            if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {

                $stmt = $conn->prepare("INSERT INTO user (`user_profpic`) VALUES (?)");
                $stmt->bind_param("s", $target_file);

                if ($stmt->execute()) {
                    $response['error'] = false;
                    $response['message'] = 'Profile Picture Uploaded Successfully';
                    $response['image'] = getBaseURL() . $target_file;
                    $response['user_profpic'] = $_POST['user_profpic'];
                } else {
                    $response['error'] = true;
                    $response['message'] = 'Could not upload profile picture, try again...';
                }
            } else {
                $response['error'] = true;
                $response['message'] = 'Try again later...';
            }

            break;


        case 'user':

            $username = $_POST['username'];
            $id = $_POST['id'];

            // get all data from user db yang udah ada profpicnya
            $stmt = $conn->prepare("SELECT `id`, `email`, `fullname`, `username`, `password`, `user_profpic` FROM user where username = '$username' or id = '$id'");
            $stmt->execute();
            $stmt->bind_result($id, $email, $fullname, $username, $password, $user_profpic);

            while ($stmt->fetch()) {
                $user = array();
                $user['id'] = $id;
                $user['email'] = $email;
                $user['fullname'] = $fullname;
                $user['username'] = $username;
                $user['password'] = $password;
                $user['user_profpic'] = $user_profpic;
                array_push($response, $user);
            }

            break;

            case 'searchSellingProducts':
        
                    $product_name = $_POST['product_name'];
                    // $product_desc = $_POST['product_desc'];
        
                    if (!isset($_POST['product_name'])) {
                        $message .= "product_name, ";
                        $is_error = true;
                    }
                    if ($is_error) {
                        $response['error'] = true;
                        $response['message'] = $message . " required.";
                    } else {
                        $stmt = "SELECT * FROM VIEW_SELLINGPOSTS WHERE product_name or product_desc LIKE '%$product_name%'";
                        $read = mysqli_query($conn, $stmt);

                        while ($row = mysqli_fetch_array($read)) {
        
                            $image = array();
                            $image['id'] = $row["id"];
                            $image['path'] = getBaseURL() . $row["path"];
                            $image['product_price'] = $row["product_price"];
                            $image['product_name'] = $row["product_name"];
                            $image['product_condition'] = $row["product_condition"];
                            $image['product_desc'] = $row["product_desc"];
                            $image['seller_loc'] = $row["seller_loc"];
                            $image['selling_status'] = $row["selling_status"];
                            $image['whatsapp'] = $row["whatsapp"];
                            $image['user_id'] = $row["user_id"];
                            $image['email'] = $row["email"];
                            $image['fullname'] = $row["fullname"];
                            $image['username'] = $row["username"];
                            $image['user_profpict'] = getBaseURL() . $row["user_profpic"];
                            $image['campaign_id'] = $row["campaign_id"];
                            $image['campaign_title'] = $row["campaign_title"];
        
        
                            array_push($response, $image);
                        }
                    }
                    break;
            
            
        default:
            $response['error'] = true;
            $response['message'] = 'Invalid Operation Called';
            break;
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
