Railscast sm-rc181
==================

include vs joins
```
both are same but it will tell keytime of using include and joins.
As per given queries below:
include: It create user model in memory while fetching comments, so it will be a long query.
         It will load associated models and attributes in memory at same time.
joins: It will only fetch comments in memory not user

```

git clone
```
git clone ''
```
Rails console
```
rails c
1. Check join
   c = Comment.all(joins: :user, conditions: { users: {admin: true}})
   c.first.user
   Both will take load time to load in memory

2.check include
   c = Comment.all(include: :user, conditions: { users: {admin: true}})
   c.first.user
   now 2nd will not take any load time as it is in memory already bcoz of include.

```
Comments controller
```
if we are using associated attributes
then change
  @comments = Comment.all(include: :user, conditions: {users: {admin: true}})
else
  @comments = Comment.all(joins: :user, conditions: {users: {admin: true}})
```
Select statements
```
include is not compatable with select, as include will rename columns and we dont have controll on that
so use joins as you can

u = User.all(joins: :comments, select: "users.*, comments.count as comment_count", group: "users.id")
u.comment_count
Now to calculate count as in index of user , there will not any separate query.

```
limitation (we cant have multiple associations of has_many :through)
```
Solution is include/joins
```


