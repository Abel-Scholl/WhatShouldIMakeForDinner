CREATE DATABASE wsimfdDB;
USE wsimfdDB;

-- The following creates a table Users to store user information
CREATE TABLE wsimfdDB.Users (
	userID BIGINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT
    , username VARCHAR(45) NOT NULL
    , password VARCHAR(64) NOT NULL
    , dateJoined DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP()
    , lastUpdated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP()
    , email VARCHAR(45)
    , phone VARCHAR(45)
    , displayName VARCHAR(45)
    , bio VARCHAR(255)
    , pfp VARBINARY(255)
);

-- The following creates a table Recipes to store recipe information
-- Includes an associated user "contributor" who created the recipe 
-- And an associated recipe "adaptedFrom" if it is a recipe that is an altered version of an previous existing one.
CREATE TABLE wsimfdDB.Recipes (
	recipeID BIGINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT
    , recipeName VARCHAR(45) NOT NULL
    , recipeDescription VARCHAR(45)
    , dateAdded DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP()
    , lastUpdated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP()
    , contributor BIGINT UNSIGNED NOT NULL
    , adaptedFrom BIGINT UNSIGNED
    , FOREIGN KEY (contributor) REFERENCES wsimfdDB.Users (userID)
	, FOREIGN KEY (adaptedFrom) REFERENCES wsimfdDB.Recipes (recipeID)
);

-- The following creates a table Ingredients to store ingredient information
CREATE TABLE wsimfdDB.Ingredients (
	ingredientID BIGINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT
    , dateAdded DATETIME DEFAULT CURRENT_TIMESTAMP
    , lastUpdated DATETIME DEFAULT CURRENT_TIMESTAMP
    , description TEXT
);

-- The following creates a table RecipeIngredients to store the ingredients involved in a recipe
-- Includes an ingredient quantity and notes for flexible description of requirements
CREATE TABLE wsimfdDB.RecipeIngredients (
	RIID BIGINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT
    , dateAdded DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
    , lastUpdated DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
    , quantity VARCHAR(45) 
    , notes VARCHAR(45)
    , ingredientID BIGINT UNSIGNED NOT NULL
    , recipeID BIGINT UNSIGNED NOT NULL
    , FOREIGN KEY (ingredientID) REFERENCES wsimfdDB.Ingredients (ingredientID)
    , FOREIGN KEY (recipeID) REFERENCES wsimfdDB.Recipes (recipeID)
);

-- The following creates a table UserRecipes to store the recipes a user has saved
CREATE TABLE wsimfdDB.UserRecipes (
	URID BIGINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT
    , dateAdded DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
    , lastUpdated DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
    , userID BIGINT UNSIGNED NOT NULL
    , recipeID BIGINT UNSIGNED NOT NULL
    , FOREIGN KEY (userID) REFERENCES wsimfdDB.Users (userID)
    , FOREIGN KEY (recipeID) REFERENCES wsimfdDB.Recipes (recipeID)
);

-- The following creates a table UserGivesIngtContribution to store what users contribute to ingredient descriptions
CREATE TABLE wsimfdDB.UserGivesIngtContribution (
	contributionID BIGINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT
    , dateAdded DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
    , lastUpdated DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
    , userID BIGINT UNSIGNED NOT NULL
    , ingredientID BIGINT UNSIGNED NOT NULL
    , FOREIGN KEY (userID) REFERENCES wsimfdDB.Users (userID)
    , FOREIGN KEY (ingredientID) REFERENCES wsimfdDB.Ingredients (ingredientID)
);

-- The following creates a table Images to store uploaded images
CREATE TABLE wsimfdDB.Images (
	imageID BIGINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT
    , dateAdded DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
    , lastUpdated DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
    , imageType ENUM('ingredient', 'recipe') NOT NULL
    , ingredientID BIGINT UNSIGNED 
    , recipeID BIGINT UNSIGNED
    , FOREIGN KEY (ingredientID) REFERENCES wsimfdDB.Ingredients (ingredientID)
    , FOREIGN KEY (recipeID) REFERENCES wsimfdDB.Recipes (recipeID)
);