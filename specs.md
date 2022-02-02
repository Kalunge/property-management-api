
## Description

In this project, I will create a Property Management fullStack App with Rails in the Backend and React and Redux in the fron end. 

## How I plan to build the "property-management-app" app
### 1. BACKEND
##### Database
- Design Database and create a UML diagram
- All associations (1-to-many relationships) and aggregations (parent-child relationships) between classes should be implemented.
- Create a schema.sql file with tables that will be analogical to the structure of the classes in your app.
  
#### Authentication
  - set up authentication Using devise and jwt

## Resources
#### 1. Users
Should have the following attributes
- name
- email
- password
- admin
- rent
- landlord/tenant

#### 2. Block
  - name
  - location
  - landlord/owner
  - houses [] 
  - tenants(users) []
  - amentities []


#### 3. Apartment
- name/number
- vacant => bool
- tenant => if booked
- amenities []

#### 4. Reservations
- visit date
- user(tenant)
- apartment
- block

## Tasks
- Create, Read, Delete and update Users
- Create, Read, Delete and update Block
- Create, Read, Delete and update Apartment
- implement model validations for Users, Block and apartment
- Implement Documentaion with Swagger
- Write Integration, model and Unit tests
- Add Authorization using Cancancan


#### IMprovements(Later)
 - Request maintainance
 - Add notifications for Rent payments
 - Reset User Password
 - Add calendy for reserving visits
 - advanced sorting and Search => location, rent range, etc
 - Admin dashboard for rent manager
 - Recommender system
 - IMplement File upload and store files in a remote server
 - IMplement Payment(stripe, Paypla, Mpesa etc)


### 2. FrontEnd(React)
#### Repo set up
  - React
  - Redux
  - logger

#### Tasks(Components and Pages)
- IMplement Landing Page
- IMplement Sign Up Page
- IMplement Login Page
- implement House Card
- Implement House Visit Reservation Modal
- IMplement NavBar
- Implement Error Handling => FallBack Page
- IMplement Add House Page
- IMplement Add Block Page
- IMplement Footer

#### Tasks(actions and Reducers)
- user Registratio
- User Login
- User Logout
  
###### House
- Get 
- Create 
- Update 
- Delete 
- Reserve

###### Block
- Get 
- Create 
- Update 
- Delete 

###### Reservation
- Get 
- Create 
- Update 
- Delete(cancel reservation)


#### 3. Mobile web app(Responsiveness)


#### Improvements(Later)
- Date handling Library
- User Reset Password page
- Admin Dashborad implementation
- Add Payments
- 



### 4. FrontEnd(React Native) => later