___INFO___

{
  "displayName": "Lucky Orange Init",
  "description": "Initialize Luck Orange on website",
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
    "displayName": "Lucky Orange site ID",
    "simpleValueType": true,
    "name": "LuckyOrangeSiteID",
    "type": "TEXT"
  },
  {
    "displayName": "Lucky Orange CDN link.",
    "simpleValueType": true,
    "name": "CDNLink",
    "type": "TEXT"
  }
]


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://d10lpsik1i8c69.cloudfront.net/w.js"
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
  },
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
                    "string": "__lo_site_id"
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
                    "boolean": false
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

//Dependencies for LO Init tag
//const log = require('logToConsole'); //uncomment if logging is needed
const setInWindow = require('setInWindow');
const injectScript = require('injectScript');
//log('data =', data); //uncomment if logging is needed

//Define the LO site id as global variable in the window object
setInWindow("__lo_site_id", data.LuckyOrangeSiteID);

//Initialize LO with the right CDN link
injectScript(data.CDNLink, data.gtmOnSuccess, data.gtmOnFailure, 'LuckyOrangeInit');


___NOTES___

Created on 8-6-2019 16:38:17
