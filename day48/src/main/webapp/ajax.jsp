<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax 실습</title>
<style type="text/css">
   img {
      cursor: pointer;
   }
</style>
</head>
<body>

<img id="photo" alt="실습용 이미지" src="">

<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script type="text/javascript">
   $("#photo").prop("src","images/gora.jpg");
   var data = 'banana'
   
   $("#photo").on("click",function(){
      $.ajax({
         url: 'test.do?result='+data,
         type: 'POST',
         success: function(result){
            console.log('result ['+result+']');
            if(result=='apple'){
               $("#photo").prop("src","images/paduck.jpg");
               data = 'apple';
            }
            else{
               $("#photo").prop("src","images/gora.jpg");
               data = 'banana';
            }
         },
         error: function(error){
            alert('error ['+error+']');
         }
      });
   });
</script>

</body>
</html>