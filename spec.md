# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [X] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
- *lots of these*
- [X] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
- *lots of these*
- [X] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
- *User has many Categories through Activities*
- *Activities have many Categories, Categories have many Activities*
- *Activity_Category belongs_to :activity, belongs_to :category*
- *Activities have many Categories, through: :activity_categories*
- *Categories have many Activities, through: :activity_categories*
- [ ] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
- *Ex. User.first.categories*
- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- *validate length of email, presence of multiple attributes, and uniqueness for multiple models*
- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- *User.most_activities*
- [X] Include signup (how e.g. Devise)
- [X] Include login (how e.g. Devise)
- [X] Include logout (how e.g. Devise)
- [X] Include third party signup/login (how e.g. Devise/OmniAuth)
- *OmniAuth Facebook*
- [X] Include nested resource show or index (URL e.g. users/2/recipes)
- */users/1/activities*
- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- *users/1/activities/new*
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)
- *yes*

Confirm:
- *goodness knows I tried!*
- [X] The application is pretty DRY
- [X] Limited logic in controllers
- [X] Views use helper methods if appropriate
- [X] Views use partials if appropriate
