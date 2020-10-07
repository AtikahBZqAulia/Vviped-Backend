import instaloader
from flask import Flask, jsonify, request

app = Flask(__name__)

L = instaloader.Instaloader()
USER = "privat.in_id"
PASSWORD = "tadimor19"
target_user = "privat.in_id"
L.login(USER, PASSWORD)

target = instaloader.Profile.from_username(L.context, target_user)

profile_pic = target.profile_pic_url


@app.route("/", methods=['GET'])
def home():
    return "Alhamdulillah!"


followers_list = target.get_followers()
list_of_followers = [{
    'ID': follower.userid,
    'Username': follower.username,
    'Fullname': follower.full_name,
} for follower in followers_list]


followings_list = target.get_followees()
list_of_followings = [{
    'ID': following.userid,
    'Username': following.username,
    'Fullname': following.full_name,
} for following in followings_list]


num_followers = target.followers
num_followings = target.followees


@app.route("/profpic", methods=['GET'])
def get_profpic():
    return jsonify({'Profil picture ': profile_pic})


@app.route("/num_followers", methods=['GET'])
def num_of_followers():
    return jsonify({'Total followers ': str(num_followers)})


@app.route("/followers", methods=['GET'])
def followers():
    return jsonify({'Followers ': str(list_of_followers)})


@app.route("/num_following", methods=['GET'])
def num_of_followings():
    return jsonify({'Total followings ': str(num_followings)})


@app.route("/followings", methods=['GET'])
def followings():
    return jsonify({'Followings ': str(list_of_followings)})


total_posts = target.mediacount


@app.route("/totalpost", methods=['GET'])
def total_post():
    return jsonify({'Total post ': str(total_posts)})


likes = set()
print("Fetching likes of all posts of profile {}.".format(target.username))


@app.route("/get_posts", methods=['GET'])
def post_detail():
    posts = target.get_posts()
    return jsonify({{
        'Image_URL': post.url,
        'Caption': post.caption,
        'Likes': post.likes,
        'Comments': [comment.text for comment in post.get_comments()],
    }for post in posts})


if __name__ == '__main__':
    app.run(debug=True)
