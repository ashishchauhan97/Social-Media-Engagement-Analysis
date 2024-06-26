-- 1. Find the oldest users of the Instagram from the database provided?
select * from users;
select username,created_at from users
order by created_at
limit 5 ;

-- 2. Find the users who have never posted a single photo on Instagram?
select * from photos;
select * from users;
select * from users u 
left join photos p
on p.user_id = u.id
where p.image_url is null
order by u.username;

-- 3. Identify the winner of the contest and provide their details to the team?
select * from likes,photos,users;
select likes.photo_id,users.username,count(likes.user_id)as no_of_likes
from likes inner join photos
on likes.photo_id=photos.id
inner join users
on photos.user_id = users.id
group by likes.photo_id,users.username
order by no_of_likes desc;

-- 4. Identify and suggest the top 5 most commonly used hastags on the platform?
select * from photo_tags,tags;
select t.tag_name,count(p.photo_id) as ht from photo_tags p
inner join tags t 
on t.id = p.tag_id
group by t.tag_name 
order by ht desc;

-- 5. what day of week do most users register on? provide insights on when to schedule an ad campaign?
select * from users;
select date_format((created_at),'%W') as d,count(username) from users
group by 1
order by  2 desc;

-- 6. Provide how many times does average user posts on Instagram. Also, provide the total number of photos on Instagram/Total no of users?
select * from users,photos;
SELECT AVG(posts_per_user) AS average_posts_per_user
FROM (
    SELECT COUNT(*) AS posts_per_user
    FROM photos
    INNER JOIN users ON photos.user_id = users.id
    GROUP BY users.id
) AS post_counts;

select * from photos;
select sum(id) as total_photos from photos;
select sum(id)as total_users from users;