<style>
            /*Profile Pic Start*/
            .picture-container1{
                position: relative;
                height: 250px;
                width: 250px;
                cursor: pointer;
                text-align: center;
            }
            .picture-container2{
                position: relative;
                height: 380px;
                width: 940px;
                cursor: pointer;
                text-align: center;
            }
            .picturePro{
                width: 250px;
                height: 250px;
                background-color: #999999;
                border: 4px solid #CCCCCC;
                color: #FFFFFF;
                border-radius: 50%;
                /*margin: 0px auto;*/
                overflow: hidden;
                transition: all 0.2s;
                -webkit-transition: all 0.2s;
            }

            .pictureBan{
                width: 940px;
                height: 380px;
                background-color: #999999;
                border: 4px solid #CCCCCC;
                color: #FFFFFF;
                border-radius: 0%;
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
                height: 250px;
                left: 0;
                opacity: 0 !important;
                position: absolute;
                top: 0;
                width: 250px;
            }
            .pictureBan input[type="file"] {
                cursor: pointer;
                display: block;
                height: 380px;
                left: 0;
                opacity: 0 !important;
                position: absolute;
                top: 0;
                width: 940px;
            }

            .picture-src{
                width: 100%;
                height: 100%;
            }
            /*Profile Pic End*/
</style>

<template>
<div>
                    <div class="picturePro" style="background: white; width: 100%; height: 100%;">
                                <img src="${profile.rows[0].profile_photo}" class="picture-src" id="wizardPicturePreviewPro" style="object-fit: cover; border-radius: 50%;" title="">
                        <input type="file" id="wizard-picturePro" class="">
                        </div>
                                            <h6>เลือกรูปภาพเพื่อเปลี่ยนภาพโปรไฟล์</h6>
                    <div id="showdivPro"></div>
</div>
</template>

<script>
  export default {
    name: 'pre-load',
    data() {
        return {
            selectedFile: null,
            images: [],
            image_fields: ['id', 'name'],
            total_images: 1               
        }
    },
    methods: {
        readURLPro: function(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#wizardPicturePreviewPro').attr('src', e.target.result).fadeIn('slow');
                    },
                    reader.readAsDataURL(input.files[0]);
                }
        }
    }
}
</script>