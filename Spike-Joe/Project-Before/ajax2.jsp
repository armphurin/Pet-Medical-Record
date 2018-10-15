<%-- 
    Document   : ajax2
    Created on : Apr 5, 2018, 11:08:24 AM
    Author     : Sattaya Singkul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Joe add taglib -->
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html><html lang="en">
    <head>
        <title>SO question 4112686</title>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <style>
            /*Profile Pic Start*/
            .picture-container1{
                position: relative;
                height: 165px;
                width: 165px;
                cursor: pointer;
                text-align: center;
            }
            .picture-container2{
                position: relative;
                height: 165px;
                width: 165px;
                cursor: pointer;
                text-align: center;
            }
            .picturePro, .pictureBan{
                width: 165px;
                height: 165px;
                background-color: #999999;
                border: 4px solid #CCCCCC;
                color: #FFFFFF;
                border-radius: 50%;
                /*margin: 0px auto;*/
                overflow: hidden;
                transition: all 0.2s;
                -webkit-transition: all 0.2s;
            }
            .picturePro:hover{
                border-color: #2ca8ff;
            }
            .pictureBan:hover{
                border-color: #2ca8ff;
            }
            .content.ct-wizard-green .picture:hover{
                border-color: #05ae0e;
            }
            .content.ct-wizard-blue .picture:hover{
                border-color: #3472f7;
            }
            .content.ct-wizard-orange .picture:hover{
                border-color: #ff9500;
            }
            .content.ct-wizard-red .picture:hover{
                border-color: #ff3b30;
            }
            .picturePro input[type="file"] {
                cursor: pointer;
                display: block;
                height: 165px;
                left: 0;
                opacity: 0 !important;
                position: absolute;
                top: 0;
                width: 165px;
            }
            .pictureBan input[type="file"] {
                cursor: pointer;
                display: block;
                height: 165px;
                left: 0;
                opacity: 0 !important;
                position: absolute;
                top: 0;
                width: 165px;
            }

            .picture-src{
                width: 100%;
                height: 165px;
            }
            /*Profile Pic End*/
        </style>

        <!-- drag and drop -->
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
        <style>
            #dragandrophandler {
                border: 2px dotted #0B85A1;
                width: 400px;
                color: #92AAB0;
                text-align: left;
                vertical-align: middle;
                padding: 10px 10px 10px 10px;
                margin-bottom: 10px;
                font-size: 200%;
            }

            #drop-zone {
                width: 360px;
                height: 240px;
                text-align: center;
                padding: 86px 0 0;
                outline: 2px dashed #92b0b3;
                outline-offset: -10px;
                -webkit-transition: outline-offset .15s ease-in-out, background-color .15s linear;
                transition: outline-offset .15s ease-in-out, background-color .15s linear;
                font-size: 1.25rem;
                background-color: #c8dadf;
                /* position: relative; */
                /* padding: 100px 20px; */
            }

            .btn-file input[type=file] {
                position: absolute;
                left: 0;
                top: 0;
                height: 100%;
                width: 100%;
                opacity: 0;
                cursor: pointer;
            }

            input[type=file] {
                display: block;
            }

            #drop-zone .drop-zone-caption {
                font-size: 20px;
                font-weight: 600;
                color: #919fa9;
                margin: 0 0 14px;
            }

            .btn.btn-primary {
                background-color: #00a8ff;
                border-color: #00a8ff;
            }
        </style>

        <script>
            $(document).ready(function () {
                // Prepare the preview for profile picture
                $("#wizard-picturePro").change(function () {
                    readURLPro(this);
                });

                $("#wizard-pictureBan").change(function () {
                    readURLBan(this);
                });
            });
            function readURLPro(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#wizardPicturePreviewPro').attr('src', e.target.result).fadeIn('slow');
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }

            function readURLBan(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#wizardPicturePreviewBan').attr('src', e.target.result).fadeIn('slow');
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>
        <!--
           <script>
             $(document).ready(function() {
                 $("#somebutton").click(function() {
                     servletCall();
                 });
        
             });
             function servletCall() {
                 $.post(
                     "GetUserServlet", 
                     {product : "Message from jsp!!"}, //meaasge you want to send
                     function(result) {
                     $('#somediv').html('Here is your result : <strong>' + result + '</strong>'); //message you want to show
                 });
             };
    </script>
        -->
        
        <!-- popup product -->
        <style>
            .popup-link{
  display:flex;
  flex-wrap:wrap;
}

.popup-link a{
    background: #333;
    color: #fff;
    padding: 10px 30px;
    border-radius: 5px;
    font-size:17px;
    cursor:pointer;
    margin:20px;
    text-decoration:none;
}

.popup-container {
    visibility: hidden;
    opacity: 0;
    transition: all 0.3s ease-in-out;
    transform: scale(1.3);
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(21, 17, 17, 0.61);
    display: flex;
    align-items: center;
}
.popup-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 50%;
    border-radius: 10px;
}
.popup-content p{
    font-size: 17px;
    padding: 10px;
    line-height: 20px;
}
.popup-content a.close{
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    background: none;
    padding: 0;
    margin: 0;
    text-decoration:none;
}

.popup-content a.close:hover{
  color:#333;
}

.popup-content span:hover,
.popup-content span:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.popup-container:target{
  visibility: visible;
  opacity: 1;
  transform: scale(1);
}

.popup-container h3{
  margin:10px;
}
/*End popup styles*/

/* Additional styles */
.popup-style-2{
  transform: scale(0.3);
  
}

.popup-style-2:target{
  transform: scale(1);
}

        </style>
</head>
<body>
    
    <c:set value="1" var="cou"></c:set>
    
    <button id="somebutton">press here</button>
    <div id="somediv"></div>

    <!-- upload profile and banner -->
    <div class="container">
        <div class="picture-container1">
            <div class="picturePro">
                <img src="https://lh3.googleusercontent.com/LfmMVU71g-HKXTCP_QWlDOemmWg4Dn1rJjxeEsZKMNaQprgunDTtEuzmcwUBgupKQVTuP0vczT9bH32ywaF7h68mF-osUSBAeM6MxyhvJhG6HKZMTYjgEv3WkWCfLB7czfODidNQPdja99HMb4qhCY1uFS8X0OQOVGeuhdHy8ln7eyr-6MnkCcy64wl6S_S6ep9j7aJIIopZ9wxk7Iqm-gFjmBtg6KJVkBD0IA6BnS-XlIVpbqL5LYi62elCrbDgiaD6Oe8uluucbYeL1i9kgr4c1b_NBSNe6zFwj7vrju4Zdbax-GPHmiuirf2h86eKdRl7A5h8PXGrCDNIYMID-J7_KuHKqaM-I7W5yI00QDpG9x5q5xOQMgCy1bbu3St1paqt9KHrvNS_SCx-QJgBTOIWW6T0DHVlvV_9YF5UZpN7aV5a79xvN1Gdrc7spvSs82v6gta8AJHCgzNSWQw5QUR8EN_-cTPF6S-vifLa2KtRdRAV7q-CQvhMrbBCaEYY73bQcPZFd9XE7HIbHXwXYA=s200-no" class="picture-src" id="wizardPicturePreviewPro" title="">
                <input type="file" id="wizard-picturePro" class="">
            </div>
            <h6 class="">Choose Picture</h6>
            <div id="showdivPro">Show : </div>
        </div>
        <div class="picture-container2">
            <div class="pictureBan">
                <img src="https://lh3.googleusercontent.com/LfmMVU71g-HKXTCP_QWlDOemmWg4Dn1rJjxeEsZKMNaQprgunDTtEuzmcwUBgupKQVTuP0vczT9bH32ywaF7h68mF-osUSBAeM6MxyhvJhG6HKZMTYjgEv3WkWCfLB7czfODidNQPdja99HMb4qhCY1uFS8X0OQOVGeuhdHy8ln7eyr-6MnkCcy64wl6S_S6ep9j7aJIIopZ9wxk7Iqm-gFjmBtg6KJVkBD0IA6BnS-XlIVpbqL5LYi62elCrbDgiaD6Oe8uluucbYeL1i9kgr4c1b_NBSNe6zFwj7vrju4Zdbax-GPHmiuirf2h86eKdRl7A5h8PXGrCDNIYMID-J7_KuHKqaM-I7W5yI00QDpG9x5q5xOQMgCy1bbu3St1paqt9KHrvNS_SCx-QJgBTOIWW6T0DHVlvV_9YF5UZpN7aV5a79xvN1Gdrc7spvSs82v6gta8AJHCgzNSWQw5QUR8EN_-cTPF6S-vifLa2KtRdRAV7q-CQvhMrbBCaEYY73bQcPZFd9XE7HIbHXwXYA=s200-no" class="picture-src" id="wizardPicturePreviewBan" title="">
                <input type="file" id="wizard-pictureBan" class="">
            </div>
            <h6 class="">Choose Picture 2</h6>
            <div id="showdivBan">Show 2 : </div>
        </div>
    </div>

    <!-- drag and drop -->

    <form class="box" method="post" action="" enctype="multipart/form-data">
        <div id="drop-zone">
            <div class="drop-zone-caption">Drag & Drop Files Here</div>
            <span class="btn btn-primary btn-file" style="position: relative">
                <span>Choose files</span>
                <input type="file" accept="image/*" onchange="loadFile(event)" id="drop-zone-file" name="files[]" multiple>
            </span>
        </div>
        <progress value="0" max="100" id="uploaderProd">0%</progress>
        <div id="showdivProd">show 3 : </div>
    </form>
    
    
        <!-- drag and drop shop view-->
    <form class="box" method="post" action="" enctype="multipart/form-data">
        <div id="drop-zoneView">
            <div class="drop-zone-caption">Drag & Drop Files Here</div>
            <span class="btn btn-primary btn-file" style="position: relative">
                <span>Choose files</span>
                <input type="file" accept="image/*" onchange="loadFile(event)" id="drop-zone-fileView" name="files[]" multiple>
            </span>
        </div>
        <progress value="0" max="100" id="uploaderView">0%</progress>
        <div id="showdivView">show 4 : </div>
    </form>
        
        <!-- popup product style -->
        <style>
            
            .popup-container{
                overflow: scroll;
            }
            
            .popup-container input{
                
  
  resize: none !important;
  width: 100% !important;
  -moz-appearance: none !important;
  -webkit-appearance: none !important;
  -o-appearance: none;
  -ms-appearance: none;
  appearance: none;
            }
            
                        .popup-container textarea{
                
  
  resize: none !important;
  width: 100% !important;
  -moz-appearance: none !important;
  -webkit-appearance: none !important;
  -o-appearance: none;
  -ms-appearance: none;
  appearance: none;
            }
            
            .popup-container label{
                color: #3498db;
                
            }
            
           .popup-container h2,
.popup-container h3 {
  color: #545454;
  font-weight: 700;
  line-height: 1.5em;
  margin: 0 0 1em 0;
  letter-spacing: -0.01em;
}

.popup-container h2 {
  font-size: 1.75em;
}

.popup-container h3 {
  font-size: 1.25em;
}

.popup-container ul {
  list-style: disc;
  margin: 0 0 2em 0;
  padding-left: 1em;
}

.popup-container ul.actions {
  cursor: default;
  list-style: none;
  padding-left: 0;
}

.popup-container ul.actions li {
  display: inline-block;
  padding: 0 1em 0 0;
  vertical-align: middle;
}

.popup-container ul.actions li:last-child {
  padding-right: 0;
}

.area-product{
    margin: 20px;
}


        </style>
        <!-- Popup product form-->
        <div class="popup-link">
            <a href="#popup1">Add</a>
            <a href="#popup2">Add</a>
        </div>
        <!--popup1-->
        <div id="popup1" class="popup-container">
            <div class="popup-content">
                <a href="#" class="close">&times;</a>
                <h3 style="text-align: center;">Product Detail</h3>
                <div class="col-sm-6">
                    
                        
                    <div class="area-product">
                        <label for="name">Product Name</label>
                        <input type="text" id="name" name="productName" />
                    </div>
                    <div class="area-product">
                        <label for="stock">Product Stock</label>
                        <input type="text" id="stock" name="productStock" onkeypress="validateIntegerNumber()(event)" />
                    </div>
                    <div class="area-product">
                        <label for="delivery">Delivery Cost</label>
                        <input type="text" id="delivery" name="productDelivery"  onkeypress="validateFloatNumber(event)" />
                    </div>
                    <br>
                        
                </div>
                <div class="col-sm-6">
                    
                                        <div class="area-product">
                        <label for="price">Price</label>
                        <input type="text" id="price" name="productPrice"  onkeypress="validateFloatNumber(event)" size="25"/>
                    </div>
                   <div class="area-product">
                        <label for="delivery" style="visibility: hidden;">Delivery Cost</label>
                        <input type="text" style="visibility: hidden;"/>
                    </div>
                                <div class="area-product">
                        <label for="minimum">Minimum Amount</label>
                        <input type="text" id="minimum" name="productMinimum"  onkeypress="validateIntegerNumber(event)" />
                    </div>
                </div>
                <div class="col-sm-12">
                                    <div class="area-product">
                        <label for="message">Description</label>
                        <textarea id="message" name="productDescription" rows="10"></textarea>
                    </div>
                </div>
                
                
                <div class="col-sm-12">
                    <form class="box" method="post" action="" enctype="multipart/form-data">
                        <div id="drop-zone${cou}">
                            <div class="drop-zone-caption">Drag & Drop Files Here</div>
                            <span class="btn btn-primary btn-file" style="position: relative">
                                <span>Choose files</span>
                                <input type="file" accept="image/*" onchange="loadFile(event)" id="drop-zone-file${cou}" name="files[]" multiple>
                            </span>
                        </div>
                        <progress value="0" max="100" id="uploaderProd${cou}">0%</progress>
                        <div id="showProd${cou}">in popup : </div>
                    </form>
                </div>
                
                
                <div class="col-sm-12">
                    <input type="submit" value="Submit" />
                </div>
                
                
            </div>
        </div>
<!-- script drag and drop 1-->
<script>
    var loadFile1 = function (event) {
        var output1 = document.getElementById('output1');
        output1.src = URL.createObjectURL(event.target.files[0]);
    };
</script>

<script>

    var obj = $("#drop-zone${cou}");
    obj.on('dragenter', function (e) {
        e.stopPropagation();
        e.preventDefault();
        $(this).css('border', '2px solid #0B85A1');
    });
    obj.on('dragover', function (e) {
        e.stopPropagation();
        e.preventDefault();
    });
    obj.on('drop', function (e) {

        $(this).css('border', '2px dotted #0B85A1');
        e.preventDefault();
        var files = e.originalEvent.dataTransfer.files;

        //We need to send dropped files to Server
        handleFileUpload${cou}(files, obj);
    });

    $(document).on('dragenter', function (e) {
        e.stopPropagation();
        e.preventDefault();
    });
    $(document).on('dragover', function (e) {
        e.stopPropagation();
        e.preventDefault();
        obj.css('border', '2px dotted #0B85A1');
    });
    $(document).on('drop', function (e) {
        e.stopPropagation();
        e.preventDefault();
    });

// automatically submit the form on file select
    $('#drop-zone-file${cou}').on('change', function (e) {
        var files = $('#drop-zone-file${cou}')[0].files;
        handleFileUpload${cou}(files, obj);
    });

    function servletCall${cou}(path) {
        $.post(
                "GetUserServlet",
                {product: path}, //meaasge you want to send
                function (result) {
                    $('#showProd${cou}').html('Here is your result : <strong>' + result + '</strong>'); //message you want to show
                });
    }
    ;

    function handleFileUpload${cou}(files, obj) {
        for (var i = 0; i < files.length; i++) {
            var fd = new FormData();
            fd.append('file', files[i]);

            console.log(files[i]);
            fireBaseImageUpload({
                'file': files[i],
                'path': '${cou}/sproduct'
            }, function (data) {
                //console.log(data);
                if (!data.error) {
                    if (data.progress) {
                        // progress update to view here

                        //update progress bar
                        var uploader1 = document.getElementById('uploaderProd${cou}');
                        uploader1.value = data.progress;
                    }
                    if (data.downloadURL) {
                        // update done
                        // download URL here "data.downloadURL"
                        console.log(data.downloadURL);
                        servletCall${cou}(data.downloadURL);
                    }
                } else {
                    console.log(data.error + ' Firebase image upload error');
                }
            });
        }
    }
    ;

</script>
                    
                    

                <!--popup2-->
                <c:set var="cou" value="2"></c:set>
        <div id="popup2" class="popup-container">
            <div class="popup-content">
                <a href="#" class="close">&times;</a>
                <h3 style="text-align: center;">Product Detail</h3>
                <div class="col-sm-6">
                    
                        
                    <div class="area-product">
                        <label for="name">Product Name</label>
                        <input type="text" id="name" name="productName" />
                    </div>
                    <div class="area-product">
                        <label for="stock">Product Stock</label>
                        <input type="text" id="stock" name="productStock" onkeypress="validateIntegerNumber()(event)" />
                    </div>
                    <div class="area-product">
                        <label for="delivery">Delivery Cost</label>
                        <input type="text" id="delivery" name="productDelivery"  onkeypress="validateFloatNumber(event)" />
                    </div>
                    <br>
                        
                </div>
                <div class="col-sm-6">
                    
                                        <div class="area-product">
                        <label for="price">Price</label>
                        <input type="text" id="price" name="productPrice"  onkeypress="validateFloatNumber(event)" size="25"/>
                    </div>
                   <div class="area-product">
                        <label for="delivery" style="visibility: hidden;">Delivery Cost</label>
                        <input type="text" style="visibility: hidden;"/>
                    </div>
                                <div class="area-product">
                        <label for="minimum">Minimum Amount</label>
                        <input type="text" id="minimum" name="productMinimum"  onkeypress="validateIntegerNumber(event)" />
                    </div>
                </div>
                <div class="col-sm-12">
                                    <div class="area-product">
                        <label for="message">Description</label>
                        <textarea id="message" name="productDescription" rows="10"></textarea>
                    </div>
                </div>
                
                
                <div class="col-sm-12">
                    <form class="box" method="post" action="" enctype="multipart/form-data">
                        <div id="drop-zone${cou}">
                            <div class="drop-zone-caption">Drag & Drop Files Here</div>
                            <span class="btn btn-primary btn-file" style="position: relative">
                                <span>Choose files</span>
                                <input type="file" accept="image/*" onchange="loadFile(event)" id="drop-zone-file${cou}" name="files[]" multiple>
                            </span>
                        </div>
                        <progress value="0" max="100" id="uploaderProd${cou}">0%</progress>
                        <div id="showProd${cou}">in popup : </div>
                    </form>
                </div>
                
                
                <div class="col-sm-12">
                    <input type="submit" value="Submit" />
                </div>
                
                
            </div>
        </div>
                    

                    
</body>
<script src="https://www.gstatic.com/firebasejs/4.12.1/firebase.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


<!-- script config firebase -->
<script>
                    //config firebase
                    var config = {
                        apiKey: "AIzaSyABXOvnuXXMaI4a8J64Gt2Y9P-V5UG-Ftw",
                        authDomain: "bakerysystem-661db.firebaseapp.com",
                        databaseURL: "https://bakerysystem-661db.firebaseio.com",
                        projectId: "bakerysystem-661db",
                        storageBucket: "bakerysystem-661db.appspot.com",
                        //messagingSenderId: "141182130037"
                    };
                    firebase.initializeApp(config);
</script>

<!-- script validate -->
<script>
    //check for valid number
            function validateNumber(evt) {
                var theEvent = evt || window.event;
                var key = theEvent.keyCode || theEvent.which;
                key = String.fromCharCode(key);
                var regex = /[0-9]|./;
                if (!regex.test(key)) {
                    theEvent.returnValue = false;
                    if (theEvent.preventDefault)
                        theEvent.preventDefault();
                }
            }
            // Check for valid email syntax
            function validateEmail(email) {
                var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return re.test(email);
            }
            // Check for valid email syntax
            function validateFloatNumber(evt) {
                var theEvent = evt || window.event;
                var key = theEvent.keyCode || theEvent.which;
                key = String.fromCharCode(key);
                var regex = /^[\d.]+$/;
                if (!regex.test(key)) {
                    theEvent.returnValue = false;
                    if (theEvent.preventDefault)
                        theEvent.preventDefault();
                }
            }
            function validateIntegerNumber(evt) {
                var theEvent = evt || window.event;
                var key = theEvent.keyCode || theEvent.which;
                key = String.fromCharCode(key);
                var regex = /^[0-9]*$/;
                if (!regex.test(key)) {
                    theEvent.returnValue = false;
                    if (theEvent.preventDefault)
                        theEvent.preventDefault();
                }
            }
</script>

<script>
    $(document).ready(function(){
    
    $('').bind('mousewheel', function(e){
        if(e.wheelDelta/120 > 0) {
            $(this).text('scrolling up');
        }
        else{
            $(this).text('scrolling down');
        }
    });
});
</script>


<!-- script profile and banner -->
<script>

    //servlet connect for send profile value
    function servletCallPro(path) {
        $.post(
                "GetUserServlet",
                {profile: path}, //meaasge you want to send
                function (result) {
                    $('#showdivPro').html('Here is your result : <strong>' + result + '</strong>'); //message you want to show
                });
    }
    ;

    //get elements profile
    var uploaderPro = document.getElementById('uploaderPro');
    var fileButtonPro = document.getElementById('wizard-picturePro');

    //Listener
    fileButtonPro.addEventListener('change', function (e) {
        //get file
        var file = e.target.files[0];

        //create a storage ref
        var storageRef = firebase.storage().ref('test/profile/' + file.name);

        //upload file
        var task = storageRef.put(file);
        console.log(file, storageRef, task);

        //update progress bar
        task.on('state_changed',
                function progress(snapshot) {
                    var percentage = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
                    uploaderPro.value = percentage;
                },
                function error(err) {},
                function complete() {
                    var downloadURL = task.snapshot.downloadURL;
                    servletCallPro(downloadURL);
                }
        );

    });


    //servlet connect for send banner value
    function servletCallBan(path) {
        $.post(
                "GetUserServlet",
                {banner: path}, //meaasge you want to send
                function (result) {
                    $('#showdivBan').html('Here is your result : <strong>' + result + '</strong>'); //message you want to show
                });
    }
    ;

    //get elements Banner
    var uploaderBan = document.getElementById('uploaderBan');
    var fileButtonBan = document.getElementById('wizard-pictureBan');

    //Listener
    fileButtonBan.addEventListener('change', function (e) {
        //get file
        var file = e.target.files[0];

        //create a storage ref
        var storageRef = firebase.storage().ref('test/banner/' + file.name);

        //upload file
        var task = storageRef.put(file);
        console.log(file, storageRef, task);

        //update progress bar
        task.on('state_changed',
                function progress(snapshot) {
                    var percentage = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
                    uploaderBan.value = percentage;
                },
                function error(err) {},
                function complete() {
                    var downloadURL = task.snapshot.downloadURL;
                    servletCallBan(downloadURL);
                }
        );

    });

</script>

<!-- script drag and drop -->
<script>
    var loadFile = function (event) {
        var output = document.getElementById('output');
        output.src = URL.createObjectURL(event.target.files[0]);
    };
</script>

<script>

    var obj = $("#drop-zone");
    obj.on('dragenter', function (e) {
        e.stopPropagation();
        e.preventDefault();
        $(this).css('border', '2px solid #0B85A1');
    });
    obj.on('dragover', function (e) {
        e.stopPropagation();
        e.preventDefault();
    });
    obj.on('drop', function (e) {

        $(this).css('border', '2px dotted #0B85A1');
        e.preventDefault();
        var files = e.originalEvent.dataTransfer.files;

        //We need to send dropped files to Server
        handleFileUpload(files, obj);
    });

    $(document).on('dragenter', function (e) {
        e.stopPropagation();
        e.preventDefault();
    });
    $(document).on('dragover', function (e) {
        e.stopPropagation();
        e.preventDefault();
        obj.css('border', '2px dotted #0B85A1');
    });
    $(document).on('drop', function (e) {
        e.stopPropagation();
        e.preventDefault();
    });

// automatically submit the form on file select
    $('#drop-zone-file').on('change', function (e) {
        var files = $('#drop-zone-file')[0].files;
        handleFileUpload(files, obj);
    });

    function servletCallProd(path) {
        $.post(
                "GetUserServlet",
                {product: path}, //meaasge you want to send
                function (result) {
                    $('#showdivProd').html('Here is your result : <strong>' + result + '</strong>'); //message you want to show
                });
    }
    ;

    function handleFileUpload(files, obj) {
        for (var i = 0; i < files.length; i++) {
            var fd = new FormData();
            fd.append('file', files[i]);

            console.log(files[i]);
            fireBaseImageUpload({
                'file': files[i],
                'path': 'test/product'
            }, function (data) {
                //console.log(data);
                if (!data.error) {
                    if (data.progress) {
                        // progress update to view here

                        //update progress bar
                        var uploaderProd = document.getElementById('uploaderProd');
                        uploaderProd.value = data.progress;
                    }
                    if (data.downloadURL) {
                        // update done
                        // download URL here "data.downloadURL"
                        console.log(data.downloadURL);
                        servletCallProd(data.downloadURL);
                    }
                } else {
                    console.log(data.error + ' Firebase image upload error');
                }
            });
        }
    }
    ;

    function fireBaseImageUpload(parameters, callBackData) {

        // expected parameters to start storage upload
        var file = parameters.file;
        var path = parameters.path;
        var name;

        //just some error check
        if (!file) {
            callBackData({error: 'file required to interact with Firebase storage'});
        }
        if (!path) {
            callBackData({error: 'Node name required to interact with Firebase storage'});
        }

        var metaData = {'contentType': file.type};
        var arr = file.name.split('.');
        var fileSize = formatBytes(file.size); // get clean file size (function below)
        var fileType = file.type;
        var n = file.name;
        var storageRef = firebase.storage().ref();

        // generate random string to identify each upload instance
        name = generateRandomString(12); //(location function below)

        //var fullPath = path + '/' + name + '.' + arr.slice(-1)[0];
        var fullPath = path + '/' + file.name;

        var uploadFile = storageRef.child(fullPath).put(file, metaData);

        // first instance identifier
        callBackData({id: name, fileSize: fileSize, fileType: fileType, fileName: n});

        uploadFile.on('state_changed', function (snapshot) {
            var progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
            progress = Math.floor(progress);
            callBackData({
                progress: progress,
                element: name,
                fileSize: fileSize,
                fileType: fileType,
                fileName: n});
        }, function (error) {
            callBackData({error: error});
        }, function () {
            var downloadURL = uploadFile.snapshot.downloadURL;
            callBackData({
                downloadURL: downloadURL,
                element: name,
                fileSize: fileSize,
                fileType: fileType,
                fileName: n});
        });
    }

    function generateRandomString(length) {
        var chars = "abcdefghijklmnopqrstuvwxyz";
        var pass = "";
        for (var x = 0; x < length; x++) {
            var i = Math.floor(Math.random() * chars.length);
            pass += chars.charAt(i);
        }
        return pass;
    }

    function formatBytes(bytes, decimals) {
        if (bytes == 0)
            return '0 Byte';
        var k = 1000;
        var dm = decimals + 1 || 3;
        var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
        var i = Math.floor(Math.log(bytes) / Math.log(k));
        return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + ' ' + sizes[i];
    }

</script>


<!-- script drag and drop view-->
<script>
    var loadFileView = function (event) {
        var outputView = document.getElementById('outputView');
        outputView.src = URL.createObjectURL(event.target.files[0]);
    };
</script>

<script>

    var obj = $("#drop-zoneView");
    obj.on('dragenter', function (e) {
        e.stopPropagation();
        e.preventDefault();
        $(this).css('border', '2px solid #0B85A1');
    });
    obj.on('dragover', function (e) {
        e.stopPropagation();
        e.preventDefault();
    });
    obj.on('drop', function (e) {

        $(this).css('border', '2px dotted #0B85A1');
        e.preventDefault();
        var files = e.originalEvent.dataTransfer.files;

        //We need to send dropped files to Server
        handleFileUpload(files, obj);
    });

    $(document).on('dragenter', function (e) {
        e.stopPropagation();
        e.preventDefault();
    });
    $(document).on('dragover', function (e) {
        e.stopPropagation();
        e.preventDefault();
        obj.css('border', '2px dotted #0B85A1');
    });
    $(document).on('drop', function (e) {
        e.stopPropagation();
        e.preventDefault();
    });

// automatically submit the form on file select
    $('#drop-zone-fileView').on('change', function (e) {
        var files = $('#drop-zone-fileView')[0].files;
        handleFileUploadView(files, obj);
    });

    function servletCallView(path) {
        $.post(
                "GetUserServlet",
                {store: path}, //meaasge you want to send
                function (result) {
                    $('#showdivView').html('Here is your result : <strong>' + result + '</strong>'); //message you want to show
                });
    }
    ;

    function handleFileUploadView(files, obj) {
        for (var i = 0; i < files.length; i++) {
            var fd = new FormData();
            fd.append('file', files[i]);

            console.log(files[i]);
            fireBaseImageUpload({
                'file': files[i],
                'path': 'test/storeView'
            }, function (data) {
                //console.log(data);
                if (!data.error) {
                    if (data.progress) {
                        // progress update to view here

                        //update progress bar
                        var uploaderView = document.getElementById('uploaderView');
                        uploaderView.value = data.progress;
                    }
                    if (data.downloadURL) {
                        // update done
                        // download URL here "data.downloadURL"
                        console.log(data.downloadURL);
                        servletCallView(data.downloadURL);
                    }
                } else {
                    console.log(data.error + ' Firebase image upload error');
                }
            });
        }
    }
    ;

</script>


<!-- script drag and drop 1-->
<script>
    var loadFile1 = function (event) {
        var output1 = document.getElementById('output1');
        output1.src = URL.createObjectURL(event.target.files[0]);
    };
</script>

<script>

    var obj = $("#drop-zone${cou}");
    obj.on('dragenter', function (e) {
        e.stopPropagation();
        e.preventDefault();
        $(this).css('border', '2px solid #0B85A1');
    });
    obj.on('dragover', function (e) {
        e.stopPropagation();
        e.preventDefault();
    });
    obj.on('drop', function (e) {

        $(this).css('border', '2px dotted #0B85A1');
        e.preventDefault();
        var files = e.originalEvent.dataTransfer.files;

        //We need to send dropped files to Server
        handleFileUpload${cou}(files, obj);
    });

    $(document).on('dragenter', function (e) {
        e.stopPropagation();
        e.preventDefault();
    });
    $(document).on('dragover', function (e) {
        e.stopPropagation();
        e.preventDefault();
        obj.css('border', '2px dotted #0B85A1');
    });
    $(document).on('drop', function (e) {
        e.stopPropagation();
        e.preventDefault();
    });

// automatically submit the form on file select
    $('#drop-zone-file${cou}').on('change', function (e) {
        var files = $('#drop-zone-file${cou}')[0].files;
        handleFileUpload${cou}(files, obj);
    });

    function servletCall${cou}(path) {
        $.post(
                "GetUserServlet",
                {product: path}, //meaasge you want to send
                function (result) {
                    $('#showProd${cou}').html('Here is your result : <strong>' + result + '</strong>'); //message you want to show
                });
    }
    ;

    function handleFileUpload${cou}(files, obj) {
        for (var i = 0; i < files.length; i++) {
            var fd = new FormData();
            fd.append('file', files[i]);

            console.log(files[i]);
            fireBaseImageUpload({
                'file': files[i],
                'path': '${cou}/sproduct'
            }, function (data) {
                //console.log(data);
                if (!data.error) {
                    if (data.progress) {
                        // progress update to view here

                        //update progress bar
                        var uploader1 = document.getElementById('uploaderProd${cou}');
                        uploader1.value = data.progress;
                    }
                    if (data.downloadURL) {
                        // update done
                        // download URL here "data.downloadURL"
                        console.log(data.downloadURL);
                        servletCall${cou}(data.downloadURL);
                    }
                } else {
                    console.log(data.error + ' Firebase image upload error');
                }
            });
        }
    }
    ;

</script>

</html>
