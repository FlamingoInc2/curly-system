Original App Design Project - README Template
===

# Flamingo Finance - Group 15

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Our app will allow users to view and recieve notifications of stocks. Users will be able to decide what stocks they would like to be alerted when it begins to rise and fall.  

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Financial 
- **Mobile:** Using Realtime Data, Push notifications.
- **Story:** Allows users to access stock prices and view price history. Also allows for price alerts.
- **Market:** Anyone who is interested with stocks or has invested in stocks. The ability to add alerts could grab others.
- **Habit:** Could be habit forming if the user is invested. As they would want to know how certain stocks are trending leading to viewing multiple times.
- **Scope:** The product can be striped down to just a list of stocks and their current price. Though the goal is to expand that to graphs of price history and push notifications for the user. Push notifications could be challanging.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [X] Layout for Login and Signin
- [ ] Layout for Mainfeed and Search
- [ ] Stocks are shown
- [ ] Stocks will have different color when rising, neutral and dropping 
- [ ] Push notifications will allow users to see stock changes 
- [ ] User will be able to create an account to save their prefered stocks
- [ ] Search bar to add more information on first page for that user

**Optional Nice-to-have Stories**

[] Graphing price history
[] Different scaling for the graphs
[] A noise sound for different push notifications (EX: money sound when rising stocks)

### 2. Screen Archetypes

* Sign in Page
   * User is able to create a account.
   * User is able to sign in to a account.
* Stocks list (Stream Page)
   * Stocks are shown.
   * Stocks have different colors based on rising or falling.
* Stock Detail
   * Stock Graph of price history.
   * Different scaling graph time frames.
* User Profile
   * Edit/Create price alerts for stocks.
   * Sign out.


### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home Feed
* Search
* Add a stock to Main page

**Flow Navigation** (Screen to Screen)

* Login Screen 
   * Home
* Registration Screen 
   * Home
* Stream Screen
    * Detailed information on stocks once it is clicked on
    * Home when clicked off screen
* Search Screen 
    * None

## Wireframes
![Imgur Image](https://imgur.com/YwA7eKJ.jpg)

## Schema 
[This section will be completed in Unit 9]
### Models

Users
| Property | Type     | Description |
| -------- | -------- | -------- |
| userId   | Number   | Unique id for the user  |
| email    | string   | User email for login |
| password | string   | Password for login     |
| followedStocks | string | Unique idenifier for stock |


Alerts
| Property | Type     | Description |
| -------- | -------- | -------- |
| alertKey | number  | Primary key  |
| userId   | Pointer to user   | Id to link to user  |
| stockSymbol    | string   | Symbol of stock |
| alertAtPrice | string  | Price that alert activates  |



### Networking

USER
| CRUD  | HTTP Verb | Example|
| -------- | -------- | -------- |
|  Read  | GET    | Getting stocks for user's feed  |
| Update   | PUT      |Adding stocks to main page |
| Delete| DELETE| deleting stock choices off main page|
 
 ALERTS
 | CRUD  | HTTP Verb | Example|
| -------- | -------- | -------- |
|  Read  | GET    | Recieve alerts on set parameters |
| Update | PUT      |Update when user would like to recieve alerts  |
| Delete| DELETE| Deleting alerts|



| Parse Method            | Example                       |
| ----------------------- | ----------------------------- |
| Create and Save objects | Adding new stock to main page |
|Query objects and set conditions| Getting stocks for user's feed|
|Query object, update properties & save| Changing stocks listed on user feed|
|Query object and delete| Deleting alerts or stocks from main page|



<img src='https://media.giphy.com/media/kIswQSQ3tuA0d4DyhN/giphy.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />
