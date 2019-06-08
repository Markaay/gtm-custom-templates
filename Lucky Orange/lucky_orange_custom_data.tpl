___INFO___

{
  "displayName": "Lucky Orange Custom data",
  "description": "Passing custom user data",
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
    "displayName": "",
    "name": "customData",
    "paramTableColumns": [
      {
        "param": {
          "displayName": "User variable name",
          "simpleValueType": true,
          "name": "key",
          "type": "TEXT"
        },
        "isUnique": true
      },
      {
        "param": {
          "displayName": "Value",
          "simpleValueType": true,
          "name": "value",
          "type": "TEXT"
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
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "_loq"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

//var log = require('logToConsole');
var copyFromWindow = require("copyFromWindow");
var callInWindow = require("callInWindow");
//log('data =', data);
var lo_userdata = {};
if(data.customData!==undefined && data.customData.length>0){
  for(var i = 0;i<data.customData.length;i++){
    lo_userdata[data.customData[i].key] = data.customData[i].value;
  }
}
if(typeof copyFromWindow("_loq") !== "undefined"){
  callInWindow("_loq.push", ["custom", lo_userdata]);
}

// Call data.gtmOnSuccess when the tag is finished.
data.gtmOnSuccess();


___NOTES___

Created on 8-6-2019 16:40:54
