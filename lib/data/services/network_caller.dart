import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/network_response.dart';

class NetworkCaller{

 static Future<NetworkResponse> getRequest({required String url})async{

    try{
      Uri uri= Uri.parse(url);
      debugPrint(url);
      final Response response = await get(uri);
      printResponse(url, response);
      if(response.statusCode==200){
        final decodeData = jsonDecode(response.body);
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodeData
        );
      }else{
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,

        );
      }
    }catch(e){
      return NetworkResponse(
          isSuccess: false,
          statusCode: -1,
       errorMessage: e.toString(),
      );
    }

  }

 static Future<NetworkResponse> postRequest(
     {required String url, Map<String, dynamic>? body})async{

   try{
     Uri uri= Uri.parse(url);
     debugPrint(url);
     final Response response = await post(uri,
         headers: {
       'content-Type' : 'application/json'
         } ,
         body: jsonEncode(body));
     printResponse(url, response);
     if(response.statusCode==200){
       final decodeData = jsonDecode(response.body);
       return NetworkResponse(
           isSuccess: true,
           statusCode: response.statusCode,
           responseData: decodeData
       );
     }else{
       return NetworkResponse(
         isSuccess: false,
         statusCode: response.statusCode,

       );
     }
   }catch(e){
     return NetworkResponse(
       isSuccess: false,
       statusCode: -1,
       errorMessage: e.toString(),
     );
   }

 }


 static void printResponse(String url, Response response){
    debugPrint(
      "URL: $url \n RESPONSE CODE : ${response.statusCode}\n Body : ${response.body}"
    );
  }

}