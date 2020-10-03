import instaloader

L = instaloader.Instaloader()

USER = "privat.in_id"
PASSWORD = "tadimor19"

L.login(USER, PASSWORD)

print("instagram login succes\nInstaloader ready to use \n")

target = instaloader.Profile.from_username(L.context, USER)

print("Followers: ", target.followers)
print("Followings: ", target.followees)
print("Jumlah post: ", target.mediacount)

likes = set()
print("Fetching likes of all posts of profile {}.".format(target.username))
for post in target.get_posts():
    print(post)
    caption_post = post.caption
    likes_count = post.likes
    likes = likes | set(post.get_likes())
    print("Caption:\n"+ caption_post)
    print("Jumlah likes", likes_count)
    print("\n")
    
    comments_box = []
    for comment in post.get_comments():
        comments_box.append(comment.text)
        print("comment :", comments_box)