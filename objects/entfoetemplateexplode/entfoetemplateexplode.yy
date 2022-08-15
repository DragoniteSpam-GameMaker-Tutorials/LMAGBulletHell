{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "EntFoeTemplateExplode",
  "spriteId": {
    "name": "spr_foe_explode",
    "path": "sprites/spr_foe_explode/spr_foe_explode.yy",
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
  ],
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"shot_density","varType":0,"value":"16","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],},
  ],
  "overriddenProperties": [
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"shot_cooldown","path":"objects/EntFoeTemplate/EntFoeTemplate.yy",},"objectId":{"name":"EntFoeTemplate","path":"objects/EntFoeTemplate/EntFoeTemplate.yy",},"value":"10",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"point_value","path":"objects/EntFoeTemplate/EntFoeTemplate.yy",},"objectId":{"name":"EntFoeTemplate","path":"objects/EntFoeTemplate/EntFoeTemplate.yy",},"value":"20",},
  ],
  "parent": {
    "name": "Templates",
    "path": "folders/Entities/Foes/Templates.yy",
  },
}