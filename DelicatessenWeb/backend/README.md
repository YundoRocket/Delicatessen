# Documentation API

> Welcome to Delicatessen API!
> Access URL (soon)
> _Everything_ is going according to **plan**.

---

### Retrieve all supported merchants

```
GET /api/merchants
```

### Result

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

### Result

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
            {
              "name": { "en": "orange", "fr": "orange", "de": "orange" },
              "image": "http://www.nutritiondesseniors.fr/wp-content/uploads/2017/01/Orange-Fruit-Pieces.jpg"
            }
          ]
        }
      ]
    },
    ...
  ]
}
```
