/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

let steps = $('.step-bar ul li');

// First step
$('.firstNext').on('click', (e) => {
    setTimeout(() => {
        $(steps[1]).find('.number').addClass('active');
    }, 1000);

    $(steps[1]).find('.line').addClass('line-active');
    $('.account-setup').css('left', '-200%');
    $('.user-details').css('left', 'calc(50% - 175px)');
});

// Second step
$('.secondNext').on('click', (e) => {
    setTimeout(() => {
        $(steps[2]).find('.number').addClass('active');
    }, 1000);

    $(steps[2]).find('.line').addClass('line-active');
    $('.user-details').css('left', '-200%');
    $('.finish-step').css('left', 'calc(50% - 175px)');
});

$('.firstPrev').on('click', (e) => {
    $(steps[1]).find('.number').removeClass('active');
    $(steps[1]).find('.line').removeClass('line-active');
    $('.user-details').css('left', '200%');
    $('.account-setup').css('left', 'calc(50% - 175px)');
});

// Last step
$('.secondPrev').on('click', (e) => {
    $(steps[2]).find('.number').removeClass('active');
    $(steps[2]).find('.line').removeClass('line-active');
    $('.finish-step').css('left', '200%');
    $('.user-details').css('left', 'calc(50% - 175px)')
});

//Form Js
$(function () {
    $(".tab_content").hide();
    //$(".tab_content:first").show(); 
    $("ul.tabs li").click(function () {
        $("ul.tabs li").removeClass("active");
        $(this).addClass("active");
        $(".tab_content").hide();
        var activeTab = $(this).attr("rel");
        //alert(activeTab);
        if (activeTab == "tab1") {
            $(".finish-step").removeClass("seller");
            $(".finish-step").addClass("customer");
        } else if (activeTab == "tab2") {
            $(".finish-step").removeClass("customer");
            $(".finish-step").addClass("seller");
        }
        $("#" + activeTab).fadeIn();

        $('.tab-select').val($(this).attr("rel"));
    });
    $('.tab-select').on('change', function () {
        $(".tab_content").hide();
        $("ul.tabs li").removeClass("active");
        var tab = $(this).val();
        //alert(tab);
        if (tab == "tab1") {
            $(".finish-step").removeClass("seller");
            $(".finish-step").addClass("customer");
        } else if (tab == "tab2") {
            $(".finish-step").removeClass("customer");
            $(".finish-step").addClass("seller");
        }
        $("ul.tabs li[rel=" + tab + "]").addClass("active");
        $("#" + tab).fadeIn();
    });
})

//tab customer and seller controll
var input1 = document.getElementById("tab1");
input1.addEventListener("click", function (event) {
    document.getElementsByClassName("finish-step").style.height = "2000%";
});
var input2 = document.getElementById("tab2");
input2.addEventListener("click", function (event) {
    document.getElementsByClassName("finish-step").style.height = "1000%";
});

document.getElementById("head_form").innerHTML = "Login";
$("#regis_button").addClass("add-visible");
$("#login_form").removeClass("fadeout").addClass("fadein").addClass("add-visible");

var input3 = document.getElementById("login_button");
input3.addEventListener("click", function (event) {
    document.getElementById("head_form").innerHTML = "Login";
    $("#login_button").removeClass("fadein").addClass("fadeout").removeClass("add-visible");
    $("#login_form").removeClass("fadeout").addClass("fadein").addClass("add-visible");
    $("#regis_form").removeClass("fadein").addClass("fadeout").removeClass("add-visible");
    $("#regis_button").removeClass("fadeout").addClass("fadein").addClass("add-visible");
    $("#bar-all").removeClass("fadein").addClass("fadeout").removeClass("add-visible");
});

var input4 = document.getElementById("regis_button");
input4.addEventListener("click", function (event) {
    document.getElementById("head_form").innerHTML = "Create new account";
    $("#regis_button").removeClass("fadein").addClass("fadeout").removeClass("add-visible");
    $("#login_button").removeClass("fadeout").addClass("fadein").addClass("add-visible");
    $("#regis_form").removeClass("fadeout").addClass("fadein").addClass("add-visible");
    $("#login_form").removeClass("fadein").addClass("fadeout").removeClass("add-visible");
    $("#bar-all").removeClass("fadeout").addClass("fadein").addClass("add-visible");
});

//submit type button div
$(document).ready(function() {
     $('#submit_login').click(function() {
        $('#login_form').submit();
     });
     $('#submit_regis1').click(function() {
         $('#accountTy').val("customer");
        $('#regis_form').submit();
     });
     
    $('#submit_regis2').click(function() {
        $('#accountTy').val("seller");
        $('#regis_form').submit();
     });

});