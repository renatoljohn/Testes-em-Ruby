Feature: Validate pets creation on PetStore Swagger API

    Scenario: Create a new random Pet with Success
        Given I have my url as "https://petstore.swagger.io/v2/pet"
        And I save my headers as:
        """
        {
            "Content-Type": "application/json",
            "Accept": "application/json"
        }
        """
        And I use the payload:
        """
        {
            "id": 0,
            "category": {
                "id": 0,
                "name": "string"
            },
            "name": "doggie",
            "photoUrls": [
                "string"
            ],
            "tags": [
                {
                "id": 0,
                "name": "string"
                }
            ],
            "status": "available"
        }
        """
        When I execute my request as a "POST"
        Then I expect to receive a status "200"
        And I expect to my response matches the "post_pets_success" schema