# Documentation API

> - Welcome to Delicatessen API!
> - Temporary access URL http://134.209.113.122
> - _Everything_ is going according to **plan**.

---

### Retrieve all supported merchants

```
GET /api/merchants
```

### Response

```
{
  "merchants": [
    {
      "loc": {
        "coordinates": [-73.97, 23.32],
        "type": "point"
      },
      "_id": "5fae84bb23df78f5a79b30fd",
      "tag": "Carrefour",
      "description": "Enseigne de grande distribution"
    },
    ...
  ]
}
```

### Retrieve all groups, categories and products

```
GET /api/groups
```

### Response

```
{
  "groups": [
    {
      "name": { "en": "food", "fr": "aliment", "de": "lebensmittel" },
      "_id": "5fb50757b0012a55171e4aa5",
      "categories": [
        {
          "name": { "en": "fruit", "fr": "fruit", "de": "obst" },
          "image": "http://www.nutritiondesseniors.fr/wp-content/uploads/2017/01/Orange-Fruit-Pieces.jpg",
          "products": [
            {
              "name": { "en": "apple", "fr": "pomme", "de": "apfel" },
              "image": "http://www.nutritiondesseniors.fr/wp-content/uploads/2017/01/Orange-Fruit-Pieces.jpg"
            },
            ...
          ]
        }
      ]
    },
    ...
  ]
}
```

### Add a new product

```
POST /api/insert-product
```

###### Body Parameters

> - **groupsName** string _required_
> - **categoryName** string _required_
> - **name** object _required_
>   - **en** string _required_
>   - **fr** string _required_
>   - **de** string _required_
> - **image** string _required_

### Request

```
{
	"groupsName": "food",
	"categoryName": "fruit",
	"name":{
		"en":"banana",
		"fr": "banane",
		"de": "banane"
	},
	"image":"https://banane.png"
}
```

### Response

```
{
    "product": {
        "name": {
            "en": "food",
            "fr": "aliment",
            "de": "lebensmittel"
        },
        "_id": "5fb50757b0012a55171e4aa5",
        "categories": [
            {
                "name": {
                    "en": "fruit",
                    "fr": "fruit",
                    "de": "obst"
                },
                "image": "http://www.nutritiondesseniors.fr/wp-content/uploads/2017/01/Orange-Fruit-Pieces.jpg",
                "products": [
                    {
                        "name": {
                            "en": "apple",
                            "fr": "pomme",
                            "de": "apfel"
                        },
                        "image": "http://www.nutritiondesseniors.fr/wp-content/uploads/2017/01/Orange-Fruit-Pieces.jpg"
                    },
                    ...
                ]
            }
        ]
    }
}
```
