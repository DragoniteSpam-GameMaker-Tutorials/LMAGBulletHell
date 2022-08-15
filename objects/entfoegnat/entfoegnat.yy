{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "EntFoeGnat",
  "spriteId": {
    "name": "spr_foe_chase",
    "path": "sprites/spr_foe_chase/spr_foe_chase.yy",
  },
  "solid": false,
  "visible": true,
  "managed": true,
  "spriteMaskId": null,
  "persistent": false,
  "parentObjectId": {
    "name": "EntFoeTemplate",
    "path": "objects/EntFoeTemplate/EntFoeTemplate.yy",
  },
  "physicsObject": false,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsGroup": 1,
  "physicsDensity": 0.5,
  "physicsRestitution": 0.1,
  "physicsLinearDamping": 0.1,
  "physicsAngularDamping": 0.1,
  "physicsFriction": 0.2,
  "physicsStartAwake": true,
  "physicsKinematic": false,
  "physicsShapePoints": [],
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":0,"eventType":3,"collisionObjectId":null,},
  ],
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"movement_speed","varType":0,"value":"180","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],},
  ],
  "overriddenProperties": [
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"point_value","path":"objects/EntFoeTemplate/EntFoeTemplate.yy",},"objectId":{"name":"EntFoeTemplate","path":"objects/EntFoeTemplate/EntFoeTemplate.yy",},"value":"40",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"health_max","path":"objects/EntFoeTemplate/EntFoeTemplate.yy",},"objectId":{"name":"EntFoeTemplate","path":"objects/EntFoeTemplate/EntFoeTemplate.yy",},"value":"4",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"damage_shield","path":"objects/EntFoeTemplate/EntFoeTemplate.yy",},"objectId":{"name":"EntFoeTemplate","path":"objects/EntFoeTemplate/EntFoeTemplate.yy",},"value":"2",},
  ],
  "parent": {
    "name": "Foes",
    "path": "folders/Entities/Foes.yy",
  },
}