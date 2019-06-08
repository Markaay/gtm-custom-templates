___INFO___

{
  "displayName": "Lucky Orange Tag",
  "description": "Tag visitors with custom labels.",
  "securityGroups": [],
  "id": "cvt_temp_public_id",
  "type": "TAG",
  "version": 1,
  "brand": {
    "displayName": "",
    "id": "brand_dummy"
  },
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "displayName": "Add your Lucky Orange tags below.",
    "name": "tags",
    "paramTableColumns": [
      {
        "param": {
          "displayName": "Name of the tag.",
          "simpleValueType": true,
          "name": "tagName",
          "type": "TEXT"
        },
        "isUnique": true
      },
      {
        "param": {
          "simpleValueType": true,
          "name": "star",
          "checkboxText": "Star this tag in Lucky Orange?",
          "type": "CHECKBOX"
        },
        "isUnique": false
      },
      {
        "param": {
          "simpleValueType": true,
          "name": "overwrite",
          "checkboxText": "Does this tag overwrite all previous tags?",
          "type": "CHECKBOX"
        },
        "isUnique": false
      }
    ],
    "type": "PARAM_TABLE"
  }
]


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": []
    },
    "isRequired": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

//var log = require('logToConsole');
var copyFromWindow = require('copyFromWindow');
var callInWindow = require('callInWindow');

//Check if LO is correctly initialized and the _loq.push function is available
if(typeof copyFromWindow("_loq") !== "undefined"){
  for(var i=0;i<data.tags.length;i++){
    //push every tag to LO
    callInWindow("_loq.push", ["tag", data.tags[i].tagName, data.tags[i].star, data.tags[i].overwrite]);
  }
}
//log('data =', data);


// Call data.gtmOnSuccess when the tag is finished.
data.gtmOnSuccess();


___NOTES___

Created on 8-6-2019 16:40:04
