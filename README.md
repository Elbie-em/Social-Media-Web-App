# Social media app with Ruby on Rails

> Social media app called "Stay In Touch".


## Built With

- Ruby v2.7.0
- Ruby on Rails v5.2.4
- VSCode
- Terminal
- Rubocop

## Live Demo

Visit live demo [here!](https://peaceful-coast-25449.herokuapp.com/)

## App Features

As a guest user:

    You can create account/log in.

As a logged-in user:

    You can see all users list.
    You are able to see selected user page with their user name and all posts written by them (the most recent posts on the top).
    You are able to send a friendship invitation.
    You can see a button “Send Friend Request” next to the name of user who is not your friend yet - on both users’ list and single user page.
    You are able to see pending friend requests sent to you from other users.
    You are able to accept or reject friend requests.
    You are able to create new posts (text only).
    You are able to like/dislike posts (but I can like single post only once).
    You are able to add comments to posts.
    You are able to see “Timeline” page with posts (with number of likes and comments) written by you and all your friends (the most recent posts on the top).


## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Ruby: 2.7.0
Rails: 5.2.4.2
Postgres: >=9.5

### Setup

Install gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```



### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
    bundle exec rspec
```


## Authors

👤 **Elbie Moonga**

- GitHub: [@Elbie-Em](https://github.com/Elbie-em)
- Twitter: [ElbieEm](https://twitter.com/ElbieEm)
- LinkedIn: [elbie-moonga](https://www.linkedin.com/in/elbie-moonga-253bbb12b/) 


👤 **Jose Fernandez Caminero**

- Github: [@fdezcaminero](https://github.com/fdezcaminero)
- Twitter: [@fdezcaminero](https://twitter.com/fdezcaminero)
- Linkedin: [Linkedin](https://www.linkedin.com/in/fdezcaminero/)

---

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Microverse](https://microverse.org)

---

## 📝 License

This project is [MIT](/LICENSE) licensed.

---
