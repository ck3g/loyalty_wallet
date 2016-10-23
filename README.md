# Loyalty Wallet

> 48hrs Ruby Rampage challenge

## Quick Intro

Here in Berlin a lot of eateries and coffee shops have loyalty stamp cards "buy 10 get 1 free". Every employee or student has a bunch of those for the area where she eats lunch. We set out to digitalize this practice.

## Description

Our Entry creates a Customer Relationship System for small and medium businesses (i.e. food or coffee vendors), who normally have paper based loyalty cards, which are stamped when a customer makes a purchase. Furthermore, a vendor has basic statistics of his users, and can offer special "Deals" to them. On the other hand we allow stamp card holders to get rid of their paper cards, which are easily lost, forgotten, or damaged.

![Screenshot](/screenshot.jpg)

## Instructions

Preparation:
You will need two devices to go through the user journey ideally 2 phones but also 1 phone + 1 laptop will do

1. Start by Signing up as a Card Holder (ideally on a phone 1 or alternatively on the laptop).

2. You will see the QR code

3. With phone number 2 scan this QR code with any standard QR scanner.

4. On the URL log in as our demo business, which already has some test data that will visualize the functionality of the features better.
    Demo login E-Mail: demovendor@example.com
    Demo login password: demo1234

5. On phone 2 (business) you will see how a new entry appears in tab History allowing verification that the transaction was successful.

6. If anything went wrong every card holder has a backup user number that can be entered manually by the business in tab Manual ID on phone 2 (business)

7. On phone 1 (card holder) the user can switch to tab Activity where a chronological history log of all "stamps" from all businesses can be found.

8. On phone 1 (card holder) the user can switch to tab My Cards where an aggregated view of his cards can be seen.

9. On phone 2 (business) you can switch to tab Analytics, where two graphs show statistics on all users who used a stamp card at your business

10. On phone 2 (business) you can go to tab Deals, where you can create and manage deals that are shown to card holders who have a stamp from your business.

11. Fill in the form to create a new deal for Today starting at the time. If the deal is active in the moment it will appear underneath in the section Active Deal. A business can have only one active deal at a time and cannot cancel an active deal to avoid confusing the card holder. A business can create multiple deals in the future if they are at different times. This future deals can be seen under the section Active Deals in section Upcoming Deals. Unlike Active Deals, Upcoming Deals can be canceled at the business's convenience.

13. On phone 1 (card holder), which has a stamp from phone 2 (business), you can go to tab Deals and see the Active Deal that is being offered by that business. The deal will disappear after the end time.


## Libraries and Tools

- Ruby on Rails
- Postgresql
- Twitter Bootstrap
- SendGrid
- Devise gem
- rqrcode gem https://github.com/whomwah/rqrcode
- RSpec + Capybara
- virtus gem
- Stock Photos https://www.pexels.com/
- JS libs: jquery, jquery-lazyload, chartist
