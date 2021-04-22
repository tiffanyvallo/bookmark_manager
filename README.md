## Bookmark Manager

### User Story 1
```
As a web user 
So that I can access websites I regularly visit
I'd like to see list of saved bookmarks
```

### User Story 2
```
As a web user
So that I can update my liost of bookmarks
I would like to add a bookmark to my current list.
```

#### Domain Model


| Nouns   | Verbs     |
|---------|-----------|
|Bookmarks| Show list, add to list |


| Nouns   | Property/ Owner|
|---------|-----------     |
|Bookmarks| Owner          |
|Bookmark |Property of Bookmarks|


| Actions  | Owned by?  |
|--------- |----------- |
|all   | Bookmarks       |
|crreate| Bookmarks |



| Actions  |Property it reads or changes |
|--------- |-----------                  |
|all | @bookmarks              |
|create | @bookmark |


|Class     | Bookmark    |
|--------- | ----------- |
|Properties| @bookmarks, @bookmark |
|Actions   | all, create|

#### Diagram planning: 
* REQUEST: client visits /bookmarks (get request) (client --> controller/server)
* controller (app.rb) asks Bookmark class (model) to retrieve bookmarks (#print_list) (server --> model)
* the Bookmark class returns all stored bookmarks as array (model --> controller/server)
* controller renders the [bookmarks] array to webpage (HTML) view (controller --> view --> controller)
* RESPONSE: This view is sent to the user as a response (controller --> client)

#### User Story 1 Features: 
  1. a Controller
  2. a Bookmark class
  3. a bookmark view
  
  ![user_story_1.png](./public/images/user_story_1.png)

## How to use
### To set up the project
Clone this repository and then run:
```
 bundle
 ```

 ### To set up the database

 Connect to `psql` and create the `bookmark_manager` database:

 ```
 CREATE DATABASE bookmark_manager;
 ```

 To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

 ### To run the Bookmark Manager app:

 ```
 rackup -p 9292
 ```

 To view bookmarks, navigate to `localhost:9292/bookmarks`

 ### To run tests:

```
rspec
```
### To run linting:
```
rubocop
```

### To Insert into table

```
INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');
```
```
INSERT INTO 
    links (url, name)
VALUES
    (1,'http://www.makersacademy.com'),
    (2,'http://askjeeves.com'),
    (3,'http://twitter.com'),
    (4,'http://www.google.com');
```
### To view table
```
bookmark_manager=# SELECT * FROM bookmarks;
```
### To delete a row from the table
```
DELETE FROM bookmarks WHERE url = 'http://www.twitter.com';
```
### To update a value from a row in the table
```
UPDATE bookmarks SET url = 'http://www.destroyallsoftware.com' WHERE url = 'http://www.askjeeves.com';
```

### Accessing the database from irb using pg
connection = PG.connect(dbname: 'bookmark_manager')
result = connection.exec('SELECT * FROM bookmarks')
result.each { |bookmark| p bookmark }
We created a connection using pg from database so that we can use Ruby coding with the connection = ...
The .exec is letting us run the postgres code ('SELECT ...) from our ruby irb
Result.each is the ruby code to be able to puts our urls from the database.

### Creating a test database
To call the database
```
psql bookmark_manager_test
```
```
$> psql
admin=# CREATE DATABASE "bookmark_manager_test";
admin=# CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));
```
