# property-management-api
A property management API to help landlords manage their properties, Users can sign up, book for a site/apartment visit and after renting can be added as Tenants. Created using TDD Approach and other core Rails  Best practices such as 
- TDD Approach => Request tests, Controller tests ....
- Exception Handling via custom errorHandlers inheriting from StandardError
- Endpoints protection 
- custom serializers/Representers
- Authentication is done using JWT. 
- Hashing Passwords with Bcrypt for Maximum protections
- LInting using Rubocop to maintain code best practices
- Kanban board for tasks distribution(more  (more Applicable in Team)
- Code Review => Reviewed my own PRs just to add an 'extra eye'
- Database design => associations and relationships
- Git-flow => feature-branch => dev => Main
- 

[specs and Build process](https://github.com/Kalunge/property-management-api/blob/dev/specs.md)

### Planned improvements
I believe in building a product incrementally and keep adding features so as to avoid living in the perfection loop. 
 - Request maintainance => Tenants can request maintainance from management
 - Add cron job for notifications => Rent payments, Booked appointments e.t.c
 - Reset User Password
 - integrate calendy for handling visits Reservations
 - advanced sorting and Search => location, rent range, etc
 - Admin dashboard for management
 - Recommender system
 - IMplement File upload and store files in a remote server
 - IMplement Payment(stripe, Paypla, Mpesa etc)
 - Add Authorization using cancancan
 - Documentation using Rswag

## Built With
- Ruby on Rails
- PostgreSQL
- Rspec
- jwt

## Getting Started

To get a local copy up and running follow these simple example steps.

- ``` git clone git@github.com:Kalunge/property-management-api.git ```


### Development Database
- ``` rails db:reset ```

### Install
- ``` bundle install ```

### Run
- ```rails s ```

### Test

- ``` rspec/spec ```

## Author

👤 **Titus Muthomi**

- GitHub: [@Kalunge](https://github.com/Kalunge)
- Twitter: [@titus_muthomi](https://twitter.com/titus_muthomi)
- LinkedIn: [Titus Muthomi](https://www.linkedin.com/in/muthomi-titus-295024181/)
## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Kalunge/property-management-api/issues).

## Show your support

Give a ⭐️ if you like this project!

## License

[MIT](./LICENSE)
