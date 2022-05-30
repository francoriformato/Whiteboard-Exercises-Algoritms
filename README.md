# Whiteboard-Exercises-Algoritms
A repository to store exercises done for Algorithms &amp; Data Structures, Databases & Computer Programming courses at UniPa and some personal exercises.

# C - Prog1
It contains two exercises written in C for UniPa's Computer Programming 1 course.

1) Puzzle:
Implement a puzzle game simulation program. We are supposed to have n tiles (n is a power of 2 and at least 32) that can be arranged on a square matrix. The game begins by asking the user to insert the n tiles chosen from three colors (or symbols). 
Then 1000 random arrays are generated using the same colors.
The 10 matrices most similar to that obtained with the cards chosen by the user are displayed.

2) Music Magazines
Simulate the automated management of a shelf of music magazines. 
It is assumed that you have a maximum of 10 types of magazines with their title, identification code, price, quantity in stock, the specific genre of the magazine (jazz, rock, pop, punk, ...) and the instruments treated (drums, guitar, trumpet ... up to a maximum of 5).
Allow the user to:
• Buy if possible a magazine given the name;
• Given a genre view all corresponding journals;
• Given a musical instrument view the magazines, in which it is entered, with the
cost and availability.

Plus, it was required to write a simple html file with a brief description about what has been done to develop the solutions.

# SQL - RestaurantDB "LoSfizioDB"
The restaurant "Lo Sfizio", a small restaurant, asks to better manage the influx of customers, their orders (in the dining room and take away) and employee shifts, paying attention to when they are respected.
The restaurant consists of a counter with a cash desk (which is used by a waiter or, very often, by the owner of the restaurant himself), three rooms with ten tables in total (in the first and third room only one waiter serves, while in the the second requires two waiters), a kitchen (in which the two cooks work).
We want to design a database for the restaurant "Lo Sfizio", which requires to take into account mainly:
• Distinguish customer orders, know what they contain and view them when necessary;
• Have a menu of products currently on sale that can be updated by the owner;
• Manage the account, both for tables and for takeaway orders;
• Know which tables are occupied at any given time;
• Manage customer reservations;
• Keep track of employees, their shifts and the permissions required.

The restaurant is normally open from 18:30 to 00:00.
The owner requires to be able to view all the data, as well as to be able to enter the shifts of his employees.

Customers don't need direct database access:
• To place the order, the various products will be inserted directly by the waiter who will report the order to the cashier, at the customer's request;
• If they want a summary of what their order contains, they should ask the waiter;
• To enter or cancel a reservation, they should call the restaurant or go to the cashier;
Bookings of booking customers must include the number of participants at the table and (optionally) whether the customer prefers an outdoor table or an indoor table.
Employees must have mandatory contact information, which can be an email or a telephone number.
Some employees have professional qualifications to take into account. Permits are requested one day at a time by employees.
Room n.1 is completely outside and smoking is allowed, while in n.2 it is not allowed to smoke and has a table on a small balcony and the other tables inside, n.3 has a space dedicated to a only table inside but has more space on a terrace and, in this room, smoking is allowed.

# Whiteboard Coding - ADS
It contains some standard algorithms (regarding Graphs, Binary / R&B Trees, Sorting..) and my solution to some exercises in pseudo-code.
I'm still improving them and I'm currently writing more of them to be prepared for the ADS exam (written test + assigned project + oral exam).
