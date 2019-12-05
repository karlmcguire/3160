-- 1. listing unpublished recipe projects by lead chef
SELECT A.name, A.pubDate, B.chefID FROM Recipe AS A
    LEFT JOIN RecipeChef AS B ON
        B.recipeID = A.recipeID
    WHERE A.pubDate IS NULL;

-- 2. listing published recipe projects by lead chef
SELECT A.name, A.pubDate, B.chefID FROM Recipe AS A
    LEFT JOIN RecipeChef AS B ON
        B.recipeID = A.recipeID
    WHERE A.pubDate IS NOT NULL;

-- 3. listing all recipe projects and include all assigned chefs
SELECT A.name, B.chefID FROM Recipe AS A
    LEFT JOIN RecipeChef AS B ON
        B.recipeID = A.recipeID;

-- 4. listing all students, their published recipes, and assigned chefs
SELECT A.name, B.chefID, C.studentID FROM Recipe AS A
    LEFT JOIN RecipeChef AS B ON
        B.recipeID = A.recipeID
    LEFT JOIN RecipeStudent AS C ON
        C.recipeID = A.recipeID;

-- 5. listing all chefs including names and salaries
SELECT chefID, firstName, lastName, salary FROM Chef;

-- 6. listing of all students with names, count of assigned, unpublished recipe
--    projects and expected graduation date
SELECT A.firstName, A.lastName, A.expectedGrad, COUNT(B.recipeID) AS projects
    FROM Student AS A
    LEFT JOIN RecipeStudent AS B ON
        B.studentID = A.studentID
    GROUP BY
        A.studentID
    ORDER BY
        A.expectedGrad ASC;

-- 7. list each recipe with recipe name, lead chef, and the number of times it
--    has been downloaded
SELECT A.name, B.chefID, C.firstName AS chefFirstName,
    C.lastName AS chefLastName, A.numberServed
    FROM Recipe AS A
    LEFT JOIN RecipeChef AS B ON
        B.recipeID = A.recipeID
    LEFT JOIN Chef AS C ON
        B.chefID = C.chefID;

-- 8. list each recipe name with its ingredients, include quantity and units
-- TODO: better grouping
SELECT A.name, GROUP_CONCAT(B.ingredientName, B.units)
    FROM Recipe AS A
    LEFT JOIN RecipeIngredient AS B ON
        B.recipeID = A.recipeID
    GROUP BY A.recipeID;

-- 9. list each recipe name with its instructions
SELECT name, instructions FROM Recipe;

-- 10. list each ecookbook with name and number of recipes in it
SELECT A.name, COUNT(B.recipeID) AS recipeCount
    FROM Cookbook AS A
    LEFT JOIN CookbookRecipe AS B ON
        B.cookbookID = A.cookbookID
    GROUP BY A.name;

-- 11. list all recipes that have received awards including name of award
--     using natural join
SELECT recipeID, name, awardName FROM Recipe NATURAL JOIN Award;

--     using inner join
SELECT A.recipeID, A.name, B.awardName
    FROM Recipe AS A
    INNER JOIN Award AS B ON
        B.recipeID = A.recipeID;
