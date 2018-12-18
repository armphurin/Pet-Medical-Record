<template>
<div class="medic-owner">
    <md-mask class="d-flex justify-content-center align-items-center">
        <container>
            <div class="header-button">
                <div class="scrolling-wrapper-flexbox text-center"  >
                    <!-- pet 1 -->
                    <label class="text-white" style="margin-top:1.3em;margin-left: 0em;" v-for="pet in pets" v-bind:key="pet.id" v-if="pet.pet_dog"><a @click="selectHeader(pet)"><div class="card-header img-scroll-dog" v-if="pet.pet_dog"></div></a>{{pet.name}}</label>
                    <label class="text-white" style="margin-top:1.3em;margin-left: 0em;" v-for="pet in pets" v-bind:key="pet.id" v-if="pet.pet_cat"><a @click="selectHeader(pet)"><div class="card-header img-scroll-cat" v-if="pet.pet_cat"></div></a>{{pet.name}}</label>
                    <!-- pet 2 to n -->
                    <!-- <label class="text-white" style="margin-top:1.3em;"><a @click="selectHeader"><div class="card-header img-scroll-cat"></div></a>Cat 2</label>
                    <label class="text-white" style="margin-top:1.3em;"><a @click="selectHeader"><div class="card-header img-scroll-dog"></div></a>Dog 3</label>
                    <label class="text-white" style="margin-top:1.3em;"><a @click="selectHeader"><div class="card-header img-scroll-cat"></div></a>Cat 4</label>
                    <label class="text-white" style="margin-top:1.3em;"><a @click="selectHeader"><div class="card-header img-scroll-cat"></div></a>Cat 2</label>
                    <label class="text-white" style="margin-top:1.3em;"><a @click="selectHeader"><div class="card-header img-scroll-dog"></div></a>Dog 3</label>
                    <label class="text-white" style="margin-top:1.3em;"><a @click="selectHeader"><div class="card-header img-scroll-cat"></div></a>Cat 4</label>
                    <label class="text-white" style="margin-top:1.3em;"><a @click="selectHeader"><div class="card-header img-scroll-cat"></div></a>Cat 2</label>
                    <label class="text-white" style="margin-top:1.3em;"><a @click="selectHeader"><div class="card-header img-scroll-dog"></div></a>Dog 3</label>
                    <label class="text-white" style="margin-top:1.3em;"><a @click="selectHeader"><div class="card-header img-scroll-cat"></div></a>Cat 4</label>
                    <label class="text-white" style="margin-top:1.3em;"><a @click="selectHeader"><div class="card-header img-scroll-cat"></div></a>Cat 2</label>
                    <label class="text-white" style="margin-top:1.3em;"><a @click="selectHeader"><div class="card-header img-scroll-dog"></div></a>Dog 3</label>
                    <label class="text-white" style="margin-top:1.3em;"><a @click="selectHeader"><div class="card-header img-scroll-cat"></div></a>Cat 4</label>
                    <label class="text-white" style="margin-top:1.3em;"><a @click="selectHeader"><div class="card-header img-scroll-cat"></div></a>Cat 2</label>
                    <label class="text-white" style="margin-top:1.3em;"><a @click="selectHeader"><div class="card-header img-scroll-dog"></div></a>Dog 3</label>
                    <label class="text-white" style="margin-top:1.3em;"><a @click="selectHeader"><div class="card-header img-scroll-cat"></div></a>Cat 4</label> -->
                </div>
            </div>
            <div class="doc-section text-center white-text">
            </div>
        </container>
    </md-mask>
    <div>
        <container>
            <div class="tab-wrapper">
                <div class="tab-panel">
                    <label for="tab-1" tabindex="0" class="tab-panel-label three-tabs"></label>
                    <input id="tab-1" type="radio" name="tabs" checked="true" aria-hidden="true" />
                    <h2 class="tab-title three-tabs">Profile</h2>

                    <div class="tab-panel-content">
                        <div v-if="pet_type">
                        <row class="medic-content">
                            <column md="4">
                                <row class="text-center">
                                    <column v-if="pet_type == 'cat'">
                                        <img src="../assets/pic_cat.png" class="medic-pic" />
              </column>
               <column v-if="pet_type == 'dog'">
                                        <img src="../assets/pic_dog2.png" class="medic-pic" />
              </column>
                                </row>
                                <row>
                                    <column>
                                        <div class="label-group">
                                            <label for="pettype">Pet Type</label>
                                            <input class="form-control form-control-lg" type="text" placeholder="Pet Type" id="pettype" v-model="pet_type" style="width:100%;margin: 0 auto;border-radius: 13px;" disabled>
                            </div>
                                    </column>
                                </row>
                                <row>
                                    <column>
                                        <div class="label-group">
                                            <label for="marking">Marking</label>
                                            <input class="form-control form-control-lg" type="text" placeholder="Pet Type" id="marking" v-model="marking" style="width:100%;margin: 0 auto;border-radius: 13px;" disabled>
                            </div>
                                    </column>
                                </row>
                            </column>
                            <column md="8">
                                <row>
                                    <column>
                                        <div class="label-group">
                                            <label for="petname">Pet Name {{med}}</label>
                                            <input class="form-control form-control-lg" type="text" placeholder="Pet Name" id="petname" v-model="pet_name" style="width:100%;margin: 0 auto;border-radius: 13px;" disabled>
                            </div>
                                    </column>
                                </row>
                                <row>
                                    <column>
                                        <div class="label-group">
                                            <label for="age">Age</label>
                                            <input class="form-control form-control-lg" type="text" value="18 Year" placeholder="Age" id="age" v-model="pet_age" style="width:100%;margin: 0 auto;border-radius: 13px;" disabled>
                            </div>
                                    </column>
                                    <column>
                                        <div class="label-group">
                                            <label for="gender">Gender</label>
                                            <input class="form-control form-control-lg" type="text" placeholder="Gender" id="gender" v-model="gender" style="width:100%;margin: 0 auto;border-radius: 13px;" disabled>
                            </div>
                                    </column>
                                </row>
                                <row>
                                    <column>
                                        <div class="label-group">
                                            <label for="breed">Breed</label>
                                            <input class="form-control form-control-lg" type="text" placeholder="Breed" id="breed" v-model="breed" style="width:100%;margin: 0 auto;border-radius: 13px;" disabled>
                            </div>
                                    </column>
                                </row>
                                <row>
                                    <column>
                                        <div class="label-group">
                                            <label for="color">Color</label>
                                            <input class="form-control form-control-lg" type="text" placeholder="Color" id="color" v-model="color" style="width:100%;margin: 0 auto;border-radius: 13px;"disabled>
                            </div>
                                    </column>
                                </row>
                            </column>
                        </row>
                        <row>
                            <column>
                                <div class="label-group">
                                    <label for="contact">Contact</label>
                                    <textarea class="form-control" id="contact" v-model="contact" rows="5" placeholder="Contact" style="width:100%;margin: 0 auto;border-radius: 13px;"></textarea>
                                </div>
                            </column>
                        </row>
                        </div>
                    </div>

                    <label for="tab-2" tabindex="0" class="tab-panel-label three-tabs"></label>
                    <input id="tab-2" type="radio" name="tabs" aria-hidden="true" />
                    <h2 class="tab-title three-tabs">Medic</h2>

                    <div class="tab-panel-content">
                        <div v-if="pet_type">
                        <!-- Medic Content -->
                        <v-select label="case_name" id="medicSelect" :options="med" v-model="selected"></v-select>
                        <hr style="width:100%;margin-top:3em;margin-bottom:2em;">
                        <h2 class="h2-responsive"><strong>Subjective Finding</strong></h2>
                        <hr style="width:100%;margin-bottom:1em;">
                        <row>
                            <column md="6">

                                <div class="table-responsive">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th align="center">Subjective Finding</th>
                                                <th align="center">Normal</th>
                                                <th align="center">Abnormal</th>
                                                <th align="center">N/A</th>
                                            </tr>
                                        </thead>
                                        <tbody v-if="selected.case_name != 'Create new Medic Case'">
                                            <tr>
                                                <td align="center">Appetite</td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_appet" id="app_norm" label="." value="norm" v-if="selected.select_appet == 'norm'" checked="checked" disabled/>
                                                    <mdb-input class="hidden" type="radio" name="select_appet" id="app_norm" label="." value="norm" v-else-if="selected.select_appet == 'abnorm'" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_appet" id="app_norm" label="." value="norm" v-else-if="selected.select_appet == 'na'" disabled />
                                                    <!-- <mdb-input class="hidden" type="radio" name="select_appet" id="app_norm" label="." value="norm" v-else-if="selected.select_appet == null" /> -->
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_appet" id="app_abnorm" label="." value="abnorm" v-if="selected.select_appet == 'norm'" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_appet" id="app_abnorm" label="." value="abnorm" v-else-if="selected.select_appet == 'abnorm'" checked="checked" disabled/>
                                                    <mdb-input class="hidden" type="radio" name="select_appet" id="app_abnorm" label="." value="abnorm" v-else-if="selected.select_appet == 'na'" disabled/>
                                                    <!-- <mdb-input class="hidden" type="radio" name="select_appet" id="app_abnorm" label="." value="abnorm" v-else-if="selected.select_appet == null"/> -->
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_appet" id="app_na" label="." value="na" v-if="selected.select_appet == 'norm'" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_appet" id="app_na" label="." value="na" v-else-if="selected.select_appet == 'abnrom'" disabled/>
                                                    <mdb-input class="hidden" type="radio" name="select_appet" id="app_na" label="." value="na" v-else-if="selected.select_appet == 'na'" checked="checked" disabled/>
                                                    <!-- <mdb-input class="hidden" type="radio" name="select_appet" id="app_na" label="." value="na" v-else-if="selected.select_appet == null" /> -->
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">Drinking</td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_drink" id="dri_norm" label="." value="norm" v-if="selected.select_drink == 'norm'" checked="checked" disabled/>
                                                    <mdb-input class="hidden" type="radio" name="select_drink" id="dri_norm" label="." value="norm" v-if="selected.select_drink == 'abnorm'" disabled/>
                                                    <mdb-input class="hidden" type="radio" name="select_drink" id="dri_norm" label="." value="norm" v-if="selected.select_drink == 'na'" disabled/>
                                                
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_drink" id="dri_abnorm" label="." value="abnorm" v-if="selected.select_drink == 'norm'" disabled/>
                                                    <mdb-input class="hidden" type="radio" name="select_drink" id="dri_abnorm" label="." value="abnorm" v-if="selected.select_drink == 'abnorm'" checked="checked" disabled/>
                                                    <mdb-input class="hidden" type="radio" name="select_drink" id="dri_abnorm" label="." value="abnorm" v-if="selected.select_drink == 'na'" disabled/>
                                                
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_drink" id="dri_na" label="." value="na" v-if="selected.select_drink == 'norm'" disabled/>
                                                    <mdb-input class="hidden" type="radio" name="select_drink" id="dri_na" label="." value="na" v-if="selected.select_drink == 'abnorm'" disabled/>
                                                    <mdb-input class="hidden" type="radio" name="select_drink" id="dri_na" label="." value="na" v-if="selected.select_drink == 'na'" checked="checked" disabled/>
                                               
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">Coughing</td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_cough" id="cou_norm" label="." value="norm" v-if="selected.select_cough == 'norm'" checked="checked" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_cough" id="cou_norm" label="." value="norm" v-if="selected.select_cough == 'abnorm'" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_cough" id="cou_norm" label="." value="norm" v-if="selected.select_cough == 'na'" disabled />
                                                
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_cough" id="cou_abnorm" label="." value="abnorm" v-if="selected.select_cough == 'norm'" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_cough" id="cou_abnorm" label="." value="abnorm" v-if="selected.select_cough == 'abnorm'" checked="checked" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_cough" id="cou_abnorm" label="." value="abnorm" v-if="selected.select_cough == 'na'" disabled />
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_cough" id="cou_na" label="." value="na" v-if="selected.select_cough == 'norm'" disabled/>
                                                    <mdb-input class="hidden" type="radio" name="select_cough" id="cou_na" label="." value="na" v-if="selected.select_cough == 'abnorm'" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_cough" id="cou_na" label="." value="na" v-if="selected.select_cough == 'na'" checked="checked" disabled/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">Sneezing</td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_sneez" id="sne_norm" label="." value="norm" v-if="selected.select_sneez == 'norm'" checked="checked" disabled/>
                                                    <mdb-input class="hidden" type="radio" name="select_sneez" id="sne_norm" label="." value="norm" v-if="selected.select_sneez == 'abnorm'" disabled/>
                                                    <mdb-input class="hidden" type="radio" name="select_sneez" id="sne_norm" label="." value="norm" v-if="selected.select_sneez == 'na'" disabled/>
                                                
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_sneez" id="sne_abnorm" label="." value="abnorm" v-if="selected.select_sneez == 'norm'"  disabled/>
                                                    <mdb-input class="hidden" type="radio" name="select_sneez" id="sne_abnorm" label="." value="abnorm" v-if="selected.select_sneez == 'abnorm'" checked="checked" disabled/>
                                                    <mdb-input class="hidden" type="radio" name="select_sneez" id="sne_abnorm" label="." value="abnorm" v-if="selected.select_sneez == 'na'" disabled/>
                                                
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_sneez" id="sne_na" label="." value="na" v-if="selected.select_sneez == 'norm'"  disabled/>
                                                    <mdb-input class="hidden" type="radio" name="select_sneez" id="sne_na" label="." value="na" v-if="selected.select_sneez == 'abnorm'" disabled/>
                                                    <mdb-input class="hidden" type="radio" name="select_sneez" id="sne_na" label="." value="na" v-if="selected.select_sneez == 'na'" checked="checked" disabled/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">Attitude</td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_att" id="att_norm" label="." value="norm" v-if="selected.select_att == 'norm'" checked="checked" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_att" id="att_norm" label="." value="norm" v-if="selected.select_att == 'abnorm'" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_att" id="att_norm" label="." value="norm" v-if="selected.select_att == 'na'" disabled />
                                                
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_att" id="att_abnorm" label="." value="abnorm" v-if="selected.select_att == 'norm'" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_att" id="att_abnorm" label="." value="abnorm" v-if="selected.select_att == 'abnorm'" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_att" id="att_abnorm" label="." value="abnorm" v-if="selected.select_att == 'na'" checked="checked" disabled />
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_att" id="att_na" label="." value="na" v-if="selected.select_att == 'norm'" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_att" id="att_na" label="." value="na" v-if="selected.select_att == 'abnorm'" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_att" id="att_na" label="." value="na" v-if="selected.select_att == 'na'" checked="checked" disabled />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">Vomiting</td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_vom" id="vom_norm" label="." value="norm" v-if="selected.select_vom == 'norm'" checked="checked" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_vom" id="vom_norm" label="." value="norm" v-if="selected.select_vom == 'abnorm'" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_vom" id="vom_norm" label="." value="norm" v-if="selected.select_vom == 'na'" disabled  />
                                                
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_vom" id="vom_abnorm" label="." value="abnorm" v-if="selected.select_vom == 'norm'"  disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_vom" id="vom_abnorm" label="." value="abnorm" v-if="selected.select_vom == 'abnorm'" checked="checked" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_vom" id="vom_abnorm" label="." value="abnorm" v-if="selected.select_vom == 'na'" disabled  />
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_vom" id="vom_na" label="." value="na" v-if="selected.select_vom == 'norm'"  disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_vom" id="vom_na" label="." value="na" v-if="selected.select_vom == 'abnorm'" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_vom" id="vom_na" label="." value="na" v-if="selected.select_vom == 'na'" checked="checked" disabled  />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">Bowels</td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_bow" id="bow_norm" label="." value="norm" v-if="selected.select_bow == 'norm'" checked="checked" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_bow" id="bow_norm" label="." value="norm" v-if="selected.select_bow == 'abnorm'" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_bow" id="bow_norm" label="." value="norm" v-if="selected.select_bow == 'na'" disabled  />
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_bow" id="bow_abnorm" label="." value="abnorm" v-if="selected.select_bow == 'norm'"  disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_bow" id="bow_abnorm" label="." value="abnorm" v-if="selected.select_bow == 'abnorm'" checked="checked" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_bow" id="bow_abnorm" label="." value="abnorm" v-if="selected.select_bow == 'na'" disabled  />
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_bow" id="bow_na" label="." value="na" v-if="selected.select_bow == 'norm'"  disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_bow" id="bow_na" label="." value="na" v-if="selected.select_bow == 'abnorm'" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_bow" id="bow_na" label="." value="na" v-if="selected.select_bow == 'na'" checked="checked" disabled  />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">Urination</td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_uri" id="uri_norm" label="." value="norm" v-if="selected.select_uri == 'norm'" checked="checked" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_uri" id="uri_norm" label="." value="norm" v-if="selected.select_uri == 'abnorm'" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_uri" id="uri_norm" label="." value="norm" v-if="selected.select_uri == 'na'" disabled  />
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_uri" id="uri_abnorm" label="." value="abnorm" v-if="selected.select_uri == 'norm'" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_uri" id="uri_abnorm" label="." value="abnorm" v-if="selected.select_uri == 'abnorm'" checked="checked" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_uri" id="uri_abnorm" label="." value="abnorm" v-if="selected.select_uri == 'na'" disabled  />
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_uri" id="uri_na" label="." value="na" v-if="selected.select_uri == 'norm'" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_uri" id="uri_na" label="." value="na" v-if="selected.select_uri == 'abnorm'" disabled />
                                                    <mdb-input class="hidden" type="radio" name="select_uri" id="uri_na" label="." value="na" v-if="selected.select_uri == 'na'" checked="checked" disabled  />
                                                </td>
                                            </tr>
                                        </tbody>
                                        <tbody v-if="selected.case_name == 'Create new Medic Case'">
                                            <tr>
                                                <td align="center">Appetite</td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_appet" id="app_norm" label="." value="norm"/>
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_appet" id="app_abnorm" label="." value="abnorm" />
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_appet" id="app_na" label="." value="na" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">Drinking</td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_drink" id="dri_norm" label="." value="norm"/>
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_drink" id="dri_abnorm" label="." value="abnorm"/>
                                                
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_drink" id="dri_na" label="." value="na"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">Coughing</td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_cough" id="cou_norm" label="." value="norm"/>
                                                
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_cough" id="cou_abnorm" label="." value="abnorm"/>
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_cough" id="cou_na" label="." value="na"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">Sneezing</td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_sneez" id="sne_norm" label="." value="norm"/>
                                                
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_sneez" id="sne_abnorm" label="." value="abnorm"/>
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_sneez" id="sne_na" label="." value="na"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">Attitude</td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_att" id="att_norm" label="." value="norm"/>
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_att" id="att_abnorm" label="." value="abnorm"/>
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_att" id="att_na" label="." value="na"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">Vomiting</td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_vom" id="vom_norm" label="." value="norm"/>
                                                
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_vom" id="vom_abnorm" label="."/>
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_vom" id="vom_na" label="." value="na"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">Bowels</td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_bow" id="bow_norm" label="." value="norm" />
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_bow" id="bow_abnorm" label="." value="abnorm" />
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_bow" id="bow_na" label="." value="na"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">Urination</td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_uri" id="uri_norm" label="." value="norm"/>
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_uri" id="uri_abnorm" label="." value="abnorm" />
                                                </td>
                                                <td align="center">
                                                    <mdb-input class="hidden" type="radio" name="select_uri" id="uri_na" label="." value="na"/>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                            </column>
                            <column md="6">
                                <row>
                                    <column md="12">
                                        <div class="label-group">
                                            <label for="pettype">Animal Name</label>
                                            <input class="form-control form-control-lg" type="text" placeholder="Animal Name" id="petname" v-model="selected.name" style="width:100%;margin: 0 auto;border-radius: 13px;">
                            </div>
                                    </column>
                                    <column md="6">
                                        <div class="label-group">
                                            <label for="petdate">Case Date</label>
                                            <datetime v-model="selected.pet_date"></datetime>
                                        </div>
                                    </column>
                                    <column md="6">
                                        <div class="label-group">
                                            <label for="pettime">Case Time</label>
                                            <datetime type="time" v-model="selected.pet_time"></datetime>
                                        </div>
                                    </column>
                                </row>
                                <row>
                                    <column md="12">
                                        <div class="label-group">
                                            <label for="spnote">Special Note</label>
                                            <textarea class="form-control" id="spnote" v-model="selected.spnote" rows="5" placeholder="Special Note" style="width:100%;margin: 0 auto;border-radius: 13px;"></textarea>
                                        </div>
                                    </column>
                                </row>
                            </column>
                        </row>
                        <h2 class="h2-responsive"><strong>Summary</strong></h2>
                        <hr style="width:100%;margin-bottom:1em;">
                        <row>
                            <column md="6">
                                <div class="label-group">
                                    <label for="pettemp">Temp:</label>
                                    <input class="form-control form-control-lg" type="text" placeholder="Temperature" id="pettemp" v-model="selected.pet_temp" style="width:100%;margin: 0 auto;border-radius: 13px;">
                            </div>
                            </column>
                            <column md="6">
                                <div class="label-group">
                                    <label for="petweight">Weight:</label>
                                    <input class="form-control form-control-lg" type="text" placeholder="Weight" id="pettweight" v-model="selected.pet_weight" style="width:100%;margin: 0 auto;border-radius: 13px;">
                            </div>
                            </column>
                            <column md="12">
                                <div class="label-group">
                                    <label for="note">Note:</label>
                                    <textarea class="form-control" id="note" v-model="selected.note" rows="5" placeholder="Note" style="width:100%;margin: 0 auto;border-radius: 13px;"></textarea>
                                </div>
                            </column>
                            <column md="12">
                                <div class="label-group">
                                    <label for="petdig">Diagnos:</label>
                                    <input class="form-control form-control-lg" type="text" placeholder="Diagnos" id="petdig" v-model="selected.pet_diag" style="width:100%;margin: 0 auto;border-radius: 13px;">
                            </div>
                            </column>
                            <column md="12">
                                <div class="label-group">
                                    <label for="pettreat">Treatment/Test:</label>
                                    <input class="form-control form-control-lg" type="text" placeholder="Treatment and Test" id="pettreat" v-model="selected.pet_treat" style="width:100%;margin: 0 auto;border-radius: 13px;">
                            </div>
                            </column>
                            <column md="12">
                                <div class="label-group">
                                    <label for="petmedic">Medication:</label>
                                    <input class="form-control form-control-lg" type="text" placeholder="Medication" id="petmedic" v-model="selected.pet_medic" style="width:100%;margin: 0 auto;border-radius: 13px;">
                            </div>
                            </column>
                            <column md="12">
                                <div class="label-group">
                                    <label for="petex">Exercise:</label>
                                    <input class="form-control form-control-lg" type="text" placeholder="Exercise" id="petex" v-model="selected.pet_ex" style="width:100%;margin: 0 auto;border-radius: 13px;">
                            </div>
                            </column>
                            <column md="12">
                                <div class="label-group">
                                    <label for="petdirect">Directory Direction:</label>
                                    <input class="form-control form-control-lg" type="text" placeholder="Directory Direction" id="petdirect" v-model="selected.pet_direct" style="width:100%;margin: 0 auto;border-radius: 13px;">
                            </div>
                            </column>
                            <column md="12">
                                <div class="label-group">
                                    <label for="recheck">Recheck Note:</label>
                                    <input class="form-control form-control-lg" type="text" placeholder="Recheck Note" id="recheck" v-model="selected.recheck" style="width:100%;margin: 0 auto;border-radius: 13px;">
                            </div>
                            </column>
                            <column md="12">
                                <div class="label-group">
                                    <label for="addition">Additional Instruction:</label>
                                    <input class="form-control form-control-lg" type="text" placeholder="Additional Instruction" id="addition" v-model="selected.addition" style="width:100%;margin: 0 auto;border-radius: 13px;">
                            </div>
                            </column>
                            <column md="6">
                                <div class="label-group">
                                    <label for="vetsig">Veterinary Signature:</label>
                                    <input class="form-control form-control-lg" type="text" placeholder="vet" id="vetsig" v-model="selected.vet_sig" style="width:100%;margin: 0 auto;border-radius: 13px;">
                            </div>
                            </column>
                            <column md="6">
                                <div class="label-group">
                                    <label for="hossig">Hospital Signature:</label>
                                    <input class="form-control form-control-lg" type="text" placeholder="hospital" id="hossig" v-model="selected.hos_sig" style="width:100%;margin: 0 auto;border-radius: 13px;">
                            </div>
                            </column>
                        </row>
                        <row>
                            <hr style="width:100%;margin-top:3em;margin-bottom:2em;">
                        </row>
                        <row style="float:right;">
                            <btn color="default" @click.native="popupAddPet = false">Reset</btn>
                            <btn color="primary" @click.native="add_pet">Submit</btn>
                        </row>
                        </div>
                    </div>

                    <label for="tab-3" tabindex="0" class="tab-panel-label three-tabs"></label>
                    <input id="tab-3" type="radio" name="tabs" aria-hidden="true" />
                    <h2 class="tab-title three-tabs">Vaccine</h2>

                    <div class="tab-panel-content">
                        <div v-if="pet_type">
                        <h2 class="h2-responsive"><strong>Vaccine Plan</strong></h2>
                        <hr style="width:100%;margin-bottom:1em;">
                        <row v-if="pet_type == 'dog'">
                            <column md="2">
                                <mdb-card class="vacts">
                                    <mdb-card-image src="/src/assets/dog/vact_dog_caninedistemper.png" alt="caninedistemper" style="width:100%; height: 80px"></mdb-card-image>
                                    <mdb-card-body>
                                        <mdb-card-title style="font-size:1.2em;">Canine Distemper</mdb-card-title>
                                        <mdb-card-text>โรคไข้หัดสุนัข</mdb-card-text>
                                        <mdb-btn color="primary" @click.native="popupPlan = true">Plan</mdb-btn>
                                    </mdb-card-body>
                                </mdb-card><br>
                            </column>
                                <column md="2">
                                    <mdb-card class="vacts">
                                        <mdb-card-image src="/src/assets/dog/vact_dog_canineparvovirus.png" alt="canineparvovirus" style="width:100%; height: 80px"></mdb-card-image>
                                        <mdb-card-body>
                                            <mdb-card-title style="font-size:1.2em;">Canine Parvovirus</mdb-card-title>
                                            <mdb-card-text>ลำไส้อักเสบติดต่อ</mdb-card-text>
                                            <mdb-btn color="primary" @click.native="popupPlan = true">Plan</mdb-btn>
                                        </mdb-card-body>
                                    </mdb-card><br>
                            </column>
                                    <column md="2">
                                        <mdb-card class="vacts">
                                            <mdb-card-image src="/src/assets/dog/vact_dog_infectiouscaninehepatitis.jpg" alt="infectiouscaninehepatitis" style="width:100%; height: 80px"></mdb-card-image>
                                            <mdb-card-body>
                                                <mdb-card-title style="font-size:1.2em;">Infectious Canine Hepatitis</mdb-card-title>
                                                <mdb-card-text>โรคตับอักเสบติดต่อ</mdb-card-text>
                                                <mdb-btn color="primary" @click.native="popupPlan = true">Plan</mdb-btn>
                                            </mdb-card-body>
                                        </mdb-card><br>
                            </column>
                                        <column md="2">
                                            <mdb-card class="vacts">
                                                <mdb-card-image src="/src/assets/dog/vact_dog_kennelcough.png" alt="kennelcough" style="width:100%; height: 80px"></mdb-card-image>
                                                <mdb-card-body>
                                                    <mdb-card-title style="font-size:1.2em;">Kennel Cough</mdb-card-title>
                                                    <mdb-card-text>โรคหลอดลมอักเสบติดต่อ</mdb-card-text>
                                                    <mdb-btn color="primary" @click.native="popupPlan = true">Plan</mdb-btn>
                                                </mdb-card-body>
                                            </mdb-card><br>
                            </column>
                                            <column md="2">
                                                <mdb-card class="vacts">
                                                    <mdb-card-image src="/src/assets/dog/vact_dog_leptospirosis.png" alt="leptospirosis" style="width:100%; height: 80px"></mdb-card-image>
                                                    <mdb-card-body>
                                                        <mdb-card-title style="font-size:1.15em;">Leptospirosis</mdb-card-title>
                                                        <mdb-card-text>โรคเล็ปโตสไปโรซิส</mdb-card-text>
                                                        <mdb-btn color="primary" @click.native="popupPlan = true">Plan</mdb-btn>
                                                    </mdb-card-body>
                                                </mdb-card><br>
                            </column>
                                                <column md="2">
                                                    <mdb-card class="vacts">
                                                        <mdb-card-image src="/src/assets/dog/vact_dog_rabiesvirus.png" alt="rabiesvirus" style="width:100%; height: 80px"></mdb-card-image>
                                                        <mdb-card-body>
                                                            <mdb-card-title style="font-size:1.2em;">Rabies Virus</mdb-card-title>
                                                            <mdb-card-text>โรคพิษสุนัขบ้า</mdb-card-text>
                                                            <mdb-btn color="info" @click.native="popupPlan = true">Edit</mdb-btn>
                                                        </mdb-card-body>
                                                    </mdb-card><br>
                            </column>
                        </row>
                        <row v-if="pet_type == 'cat'">
                            <column md="2">
                                <mdb-card class="vacts">
                                    <mdb-card-image src="/src/assets/cat/vact_cat_felinecalicivirus.PNG" alt="felinecalicivirus" style="width:100%; height: 80px"></mdb-card-image>
                                    <mdb-card-body>
                                        <mdb-card-title style="font-size:1.2em;">Feline Calicivirus</mdb-card-title>
                                        <mdb-card-text>โรคเกิดจากไวรัสพิเศษ</mdb-card-text>
                                        <mdb-btn color="primary" @click.native="popupPlan = true">Plan</mdb-btn>
                                    </mdb-card-body>
                                </mdb-card><br>
                            </column>
                                <column md="2">
                                    <mdb-card class="vacts">
                                        <mdb-card-image src="/src/assets/cat/vact_cat_felineinfectiousperitonitis.png" alt="felineinfectiousperitonitis" style="width:100%; height: 80px"></mdb-card-image>
                                        <mdb-card-body>
                                            <mdb-card-title style="font-size:1.2em;">Feline Infectious Peritonitis</mdb-card-title>
                                            <mdb-card-text>ช่องท้องอักเสบ</mdb-card-text>
                                            <mdb-btn color="primary" @click.native="popupPlan = true">Plan</mdb-btn>
                                        </mdb-card-body>
                                    </mdb-card><br>
                            </column>
                                    <column md="2">
                                        <mdb-card class="vacts">
                                            <mdb-card-image src="/src/assets/cat/vact_cat_felineleukemiavirus.PNG" alt="felineleukemiavirus" style="width:100%; height: 80px"></mdb-card-image>
                                            <mdb-card-body>
                                                <mdb-card-title style="font-size:1.2em;">Feline Leukemia Virus</mdb-card-title>
                                                <mdb-card-text>โรคลิวคีเมีย</mdb-card-text>
                                                <mdb-btn color="primary" @click.native="popupPlan = true">Plan</mdb-btn>
                                            </mdb-card-body>
                                        </mdb-card><br>
                            </column>
                                        <column md="2">
                                            <mdb-card class="vacts">
                                                <mdb-card-image src="/src/assets/cat/vact_cat_felineviralrhinotracheitis.PNG" alt="felineviralrhinotracheitis" style="width:100%; height: 80px"></mdb-card-image>
                                                <mdb-card-body>
                                                    <mdb-card-title style="font-size:1.2em;">Feline Viral Rhinotracheitis</mdb-card-title>
                                                    <mdb-card-text>โรคหวัดแมวและไข้หัดแมว</mdb-card-text>
                                                    <mdb-btn color="primary" @click.native="popupPlan = true">Plan</mdb-btn>
                                                </mdb-card-body>
                                            </mdb-card><br>
                            </column>
                                                <column md="2">
                                                    <mdb-card class="vacts">
                                                        <mdb-card-image src="/src/assets/dog/vact_dog_rabiesvirus.png" alt="rabiesvirus" style="width:100%; height: 80px"></mdb-card-image>
                                                        <mdb-card-body>
                                                            <mdb-card-title style="font-size:1.2em;">Rabies Virus</mdb-card-title>
                                                            <mdb-card-text>โรคพิษสุนัขบ้า</mdb-card-text>
                                                            <mdb-btn color="info" @click.native="popupPlan = true">Edit</mdb-btn>
                                                        </mdb-card-body>
                                                    </mdb-card><br>
                            </column>
                        </row>
                    </div>
                    </div>
                </div>
            </div>
        </container>
    </div>

    <!-- Popup Add pet -->
    <modal v-if="popupPlan" @close="popupPlan = false" size="lg">
        <div class="popup-profile">
            <modal-header>
                <modal-title>Planning your Vaccine</modal-title>
            </modal-header>
            <modal-body>
                <row>
                    <column md="12">
                        <div class="label-group">
                            <label for="plandate">Plan Vaccine</label>
                            <datetime type="datetime" v-model="plandate"></datetime>
                        </div>
                    </column>
                </row>
            </modal-body>
            <modal-footer>
                <btn color="default" @click.native="popupPlan = false">Close</btn>
                <btn color="primary" @click.native="add_pet">Submit</btn>
            </modal-footer>
        </div>
    </modal>
    <!-- Popup -->
</div>
<!--/.ViewWrapper-->
</template>

<script>
import db from "./firebaseInit";
import firebase from "firebase";
import {
    Container,
    Row,
    Column,
    Navbar,
    NavbarCollapse,
    NavbarNav,
    NavbarItem,
    mdbInput,
    ViewWrapper,
    MdMask,
    Btn,
    mdbNavbarBrand,
    Card,
    CardImg,
    CardHeader,
    CardBody,
    CardTitle,
    CardText,
    CardFooter,
    CardUp,
    CardAvatar,
    CardGroup,
    Fa,
    Modal,
    ModalHeader,
    ModalTitle,
    ModalBody,
    ModalFooter,
    Pagination,
    PageNav,
    PageItem,
    mdbTable,
    mdbTblHead,
    mdbTblBody,
    mdbCard,
    mdbCardImage,
    mdbCardBody,
    mdbCardTitle,
    mdbCardText,
    mdbBtn
} from "mdbvue";

import {
    Datetime
} from "vue-datetime";

export default {
    beforeCreate: function () {
        document.body.className = "body-medic";
    },
    name: "medic",
    components: {
        Container,
        Row,
        Column,
        Navbar,
        NavbarCollapse,
        NavbarNav,
        NavbarItem,
        mdbInput,
        ViewWrapper,
        MdMask,
        Btn,
        mdbNavbarBrand,
        Card,
        CardImg,
        CardHeader,
        CardBody,
        CardTitle,
        CardText,
        CardFooter,
        CardUp,
        CardAvatar,
        CardGroup,
        Fa,
        Modal,
        ModalHeader,
        ModalTitle,
        ModalBody,
        ModalFooter,
        datetime: Datetime,
        Pagination,
        PageNav,
        PageItem,
        mdbInput,
        mdbTable,
        mdbTblHead,
        mdbTblBody,
        mdbCard,
        mdbCardImage,
        mdbCardBody,
        mdbCardTitle,
        mdbCardText,
        mdbBtn
    },
    data() {
        return {
            pets: [],
            med: "",
            selected: null,
            pet_name: "",
            pet_type: "",
            pet_age: "",
            breed: "",
            color: "",
            marking: "",
            medical_record: [],
            loading: true,
            popupProfile: false,
            popupPet: false,
            popupPlan: false,
            progressUpload: 0,
            file: File,
            uploadTask: "",
            image: "",
            pettemp: "",
            datebirth: "",
            petbirth: "",
            options: [{
                    countryCode: "AU",
                    countryName: "Australia"
                },
                {
                    countryCode: "CA",
                    countryName: "Canada"
                },
                {
                    countryCode: "CN",
                    countryName: "China"
                },
                {
                    countryCode: "DE",
                    countryName: "Germany"
                },
                {
                    countryCode: "JP",
                    countryName: "Japan"
                },
                {
                    countryCode: "MX",
                    countryName: "Mexico"
                },
                {
                    countryCode: "CH",
                    countryName: "Switzerland"
                },
                {
                    countryCode: "US",
                    countryName: "United States"
                }
            ]
        };
    },
    methods: {
        selectHeader(pet) {
            this.selected = "Select Case";
            var allelement = document.getElementsByClassName("selectedHeader");
            // console.log(allelement);
            for (var i = 0; i < allelement.length; i++) {
                console.log("inloop" + i);
                allelement[i].classList.remove("selectedHeader");
            }
            // e.target.className += " selectedHeader";
            // console.log(e.target.className);
            this.pet_name = pet.name;
            this.pet_type = pet.type;
            this.breed = pet.breed;
            this.pet_age = pet.age;
            this.marking = pet.marking;
            this.gender = pet.gender;
            this.color = pet.color;
            this.med = pet.medical_record;
            let objHead = {case_name:"Create new Medic Case"};
            if(this.med[0].case_name != "Create new Medic Case"){
                this.med.unshift(objHead)
            }
            if(this.med[0].pet_date != null){
                console.log(this.headerConcat(this.med[0].pet_date.split("T")[0],this.med[0].pet_treat))
            }
        },
        headerConcat(date, head){
            return date+": "+head;
        },
        calAgePet(e) {
            if (!e) {
                return 0;
            } else {
                var today = new Date();
                var dob = e.split("-");
                var year = Number(dob[0]);
                var month = Number(dob[1]) - 1;
                var split_day = dob[2].split("T");
                var day = Number(today.getDate()) - Number(split_day[0]);
                var yearsOld = Number(today.getFullYear()) - year;
                var monthsOld = today.getMonth() - month;
                // console.log(
                    // "Age : " +
                    // yearsOld +
                    // " years " +
                    // monthsOld +
                    // " months " +
                    // day +
                    // " days "
                // );
                if (yearsOld == 0) {
                    return monthsOld + " Months";
                } else if (yearsOld > 0 && monthsOld > 0) {
                    return yearsOld + " Years " + monthsOld + " Months";
                } else if (yearsOld > 0 && monthsOld < 0) {
                    yearsOld = yearsOld - 1;
                    monthsOld = 12 + monthsOld;
                    return yearsOld + " Years " + monthsOld + " Months";
                } else {
                    return yearsOld + " Years ";
                }
            }
        },
    },
    created() {
        db.collection("users")
            .doc(firebase.auth().currentUser.email)
            .collection("pets")
            .orderBy("pet_id")
            .get()
            .then(querySnapshot => {
                this.loading = false;
                querySnapshot.forEach(doc => {
                    const data = {
                        id: doc.id,
                        medical_record: doc.data().medical,
                        pet_id: doc.data().pet_id,
                        name: doc.data().pet_name,
                        breed: doc.data().breed,
                        color: doc.data().color,
                        // dob: doc.data().dob,
                        gender: doc.data().gender,
                        marking: doc.data().marking,
                        type: doc.data().pet_type,
                        age: this.calAgePet(doc.data().dob),
                        imagePet: doc.data().urlImagePet,
                        pet_dog: doc.data().pet_dog,
                        pet_cat: doc.data().pet_cat
                    };
                    
                    // console.log(doc.data());
                    this.pets.push(data);
                }).
                this.email = firebase.auth().currentUser.email;
                // console.log(this.email);
                // console.log(this.pets[0].age)
            });
    },
    mounted() {
        var area_select = document.querySelector(".scrolling-wrapper-flexbox");
        // console.log(area_select.classList);
        var selectH = document.getElementsByClassName("card-header");
        if (selectH.length < 10) {
            area_select.classList.add("scrolling-wrapper-flexbox-min");
        } else {
            area_select.classList.remove("scrolling-wrapper-flexbox-min");
        }
    }
};
</script>

<style>
body.body-medic {
    background: url("../assets/bg_doc2.jpg") no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}

.vdatetime-input {
    width: 100%;
    margin: 0 auto;
    border-radius: 13px;
    border: 1px solid #ced4da;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    text-rendering: auto;
    color: initial;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    margin: 0em;
    font: 400 13.3333px Arial;
    -webkit-writing-mode: horizontal-tb !important;
    padding: 0.5rem 1rem;
    font-size: 1.25rem;
    line-height: 1.5;
}
</style><style scoped>
body.body-medic {
    background: url("../assets/bg_doc2.jpg") no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}

.medic-owner {
    margin-top: 3.5em;
}

/* checkbox and radio style */
/* input[type="radio"]:disabled:not([readonly])+label{
    background-color: white;
    color:white;
} */

input[type="checkbox"],
input[type="radio"] {
    border: 0;
    clip: rect(0 0 0 0);
    height: 1px;
    margin: -1px;
    overflow: hidden;
    padding: 0;
    position: absolute;
    width: 1px;
}

input[type="checkbox"]:hover+label:before,
input[type="radio"]:hover+label:before {
    border-color: #999;
}

input[type="checkbox"]:active+label:before,
input[type="radio"]:active+label:before {
    transition-duration: 0;
    filter: brightness(0.2);
}

input[type="checkbox"]+label,
input[type="radio"]+label {
    position: relative;
    padding-left: 26px;
    font-weight: normal;
}

input[type="checkbox"]+label:before,
input[type="checkbox"]+label:after,
input[type="radio"]+label:before,
input[type="radio"]+label:after {
    box-sizing: content-box;
    position: absolute;
    content: "";
    display: block;
    left: 0;
}

input[type="checkbox"]+label:before,
input[type="radio"]+label:before {
    top: 50%;
    width: 16px;
    height: 16px;
    margin-top: -10px;
    border: 2px solid #d9d9d9;
    text-align: center;
}

input[type="checkbox"]+label:after,
input[type="radio"]+label:after {
    background-color: #00bad2;
    top: 50%;
    left: 6px;
    width: 8px;
    height: 8px;
    margin-top: -4px;
    transform: scale(0);
    transform-origin: 50%;
    transition: transform 200ms ease-out;
}

input[type="radio"]:checked+label:before {
    -moz-animation: borderscale 300ms ease-in;
    -webkit-animation: borderscale 300ms ease-in;
    animation: borderscale 300ms ease-in;
    background-color: #fff;
}

input[type="radio"]:checked+label:after {
    transform: scale(1);
}

input[type="radio"]+label:before,
input[type="radio"]+label:after {
    border-radius: 50%;
}

input[type="checkbox"]+label:after {
    background-color: transparent;
    top: 50%;
    left: 5px;
    width: 7px;
    height: 4px;
    margin-top: -5px;
    border-style: solid;
    border-color: #00bad2;
    border-width: 0 0 3px 3px;
    -moz-transform: rotate(-45deg) scale(0);
    -ms-transform: rotate(-45deg) scale(0);
    -webkit-transform: rotate(-45deg) scale(0);
    transform: rotate(-45deg) scale(0);
    -moz-transition: none;
    -o-transition: none;
    -webkit-transition: none;
    transition: none;
}

input[type="checkbox"]:checked+label:before {
    -moz-animation: borderscale 200ms ease-in;
    -webkit-animation: borderscale 200ms ease-in;
    animation: borderscale 200ms ease-in;
}

input[type="checkbox"]:checked+label:after {
    content: "";
    -moz-transform: rotate(-45deg) scale(1);
    -ms-transform: rotate(-45deg) scale(1);
    -webkit-transform: rotate(-45deg) scale(1);
    transform: rotate(-45deg) scale(1);
    -moz-transition: -moz-transform 200ms ease-out;
    -o-transition: -o-transform 200ms ease-out;
    -webkit-transition: -webkit-transform 200ms ease-out;
    transition: transform 200ms ease-out;
}

@-moz-keyframes borderscale {
    50% {
        box-shadow: 0 0 0 2px #999;
    }
}

@-webkit-keyframes borderscale {
    50% {
        box-shadow: 0 0 0 2px #999;
    }
}

@keyframes borderscale {
    50% {
        box-shadow: 0 0 0 2px #999;
    }
}

/* checkbox and radio style */

/* dot style */
.scrolling-wrapper {
    overflow-x: scroll;
    overflow-y: hidden;
    white-space: nowrap;
}

.scrolling-wrapper .card-header {
    display: inline-block;
    color: white;
    border-radius: 50%;
}

.scrolling-wrapper-flexbox {
    display: flex;
    flex-wrap: nowrap;
    overflow-x: auto;
    align-items: center;
    /* justify-content: center; */
}

.scrolling-wrapper-flexbox-min {
    justify-content: center;
}

.scrolling-wrapper-flexbox:first-child {
    z-index: 1;
}

.scrolling-wrapper-flexbox .card-header {
    flex: 0 0 auto;
    margin-top: 0.3em;
    margin-bottom: 0.3em;
    margin-right: 0.3em;
    margin-left: 0.3em;
    color: white;
    border-radius: 50%;
}

.card-header {
    border: 2px solid #c2c2c2;
    width: 50px;
    height: 50px;
    font-size: 100%;
    padding: 33px;
    -webkit-transition: all 200ms ease-in;
    -webkit-transform: scale(1);
    -ms-transition: all 200ms ease-in;
    -ms-transform: scale(1);
    -moz-transition: all 200ms ease-in;
    -moz-transform: scale(1);
    transition: all 200ms ease-in;
    transform: scale(1);
}

.card-header:hover {
    border: 2px solid #e8c547;
    box-shadow: 0px 0px 5px #000000;
    -webkit-transition: all 200ms ease-in;
    -webkit-transform: scale(1.5);
    -ms-transition: all 200ms ease-in;
    -ms-transform: scale(1.5);
    -moz-transition: all 200ms ease-in;
    -moz-transform: scale(1.5);
    transition: all 200ms ease-in;
    transform: scale(1.5);
    z-index: 2;
    position: relative;
    margin-left: 1.5em;
    margin-right: 1.5em;
    margin-bottom: 1em;
}

.selectedHeader {
    border: 2px solid #e8c547;
    box-shadow: 0px 0px 5px #000000;
    width: 100px;
    height: 100px;
    margin-left: 100px;
}

.scrolling-wrapper,
.scrolling-wrapper-flexbox {
    height: 100%;
    width: 100%;
    -webkit-overflow-scrolling: touch;
}

.scrolling-wrapper::-webkit-scrollbar,
.scrolling-wrapper-flexbox::-webkit-scrollbar {
    display: none;
}

.img-scroll-dog {
    background: url("../assets/pic_dog2.png");
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}

.img-scroll-cat {
    background: url("../assets/pic_cat.png");
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}

/* dot style */

/* tab doc style */
.tab-wrapper {
    width: 100%;
    margin: 40px auto;
    /* display: inline-block; */
}

@media screen and (max-width: 45em) {
    .tab-wrapper {
        width: 100%;
        display: block;
    }
}

/* panel style */
.tab-panel {
    position: relative;
    /* border: solid 1px #e5e5e5; */
    border-radius: 6px;
    font-family: "Open sans", sans-serif;
}

.tab-panel>.tab-panel-label {
    position: absolute;
    z-index: 1;
    padding: 10px;
    height: 44px;
    outline: none;
    font-size: 16px;
    line-height: 24px;
    box-sizing: border-box;
}

@media screen and (max-width: 45em) {
    .tab-panel>.tab-panel-label {
        width: 100% !important;
        height: 44px;
    }
}

.tab-panel>.tab-panel-label~label {
    position: absolute;
    top: 0;
}

@media screen and (max-width: 45em) {
    .tab-panel>.tab-panel-label~label {
        position: absolute;
        left: 0 !important;
        top: unset;
    }
}

.tab-panel>.tab-panel-label:nth-child(1) {
    left: 0;
}

.tab-panel>.tab-panel-label:nth-child(9) {
    left: 66.66666%;
}

.tab-panel>.tab-panel-label:hover {
    cursor: pointer;
}

.tab-panel>h2 {
    padding: 10px;
    height: 44px;
    outline: none;
    font-size: 16px;
    line-height: 24px;
}

@media screen and (max-width: 45em) {
    .tab-panel>h2 {
        width: 100% !important;
        height: 44px;
    }
}

.tab-panel>h2~h2 {
    position: absolute;
    top: 0;
}

@media screen and (max-width: 45em) {
    .tab-panel>h2~h2 {
        width: 100%;
        position: static !important;
    }
}

.tab-panel>h2:nth-child(3) {
    left: 0;
    border-bottom: 1px solid #e5e5e5;
    border-top-left-radius: 6px;
}

@media screen and (max-width: 45em) {
    .tab-panel>h2:nth-child(3) {
        border-top-right-radius: 6px;
    }
}

.tab-panel>h2:nth-child(7) {
    border-bottom: 1px solid #e5e5e5;
    border-left: 1px solid #e5e5e5;
    border-radius: 15px 100px 0px 0px;
}

@media screen and (max-width: 45em) {
    .tab-panel>h2:nth-child(7) {
        border-bottom: none;
        border-left: none;
        border-top: 1px solid #e5e5e5;
        border-radius: 0px;
    }
}

.tab-panel>h2:nth-child(11) {
    left: 66.66666%;
    border-bottom: 1px solid #e5e5e5;
    border-left: 1px solid #e5e5e5;
    border-top-right-radius: 6px;
    border-radius: 15px 100px 0px 0px;
}

@media screen and (max-width: 45em) {
    .tab-panel>h2:nth-child(11) {
        border-bottom: none;
        border-left: none;
        border-top: 1px solid #e5e5e5;
        border-top-right-radius: 0px;
        border-bottom-right-radius: 6px;
        border-bottom-left-radius: 6px;
        border-radius: 0px;
    }
}

.tab-panel>input {
    opacity: 0;
    position: absolute;
}

@media screen and (max-width: 45em) {
    .tab-panel>input {
        width: 100%;
        height: 44px;
    }
}

.tab-panel>input+h2+.tab-panel-content {
    position: absolute !important;
    clip: rect(1px, 1px, 1px, 1px);
    padding: 0 !important;
    border: 0 !important;
    height: 1px !important;
    width: 1px !important;
    overflow: hidden;
}

.tab-panel>input:checked+h2 {
    background: #ffffff;
    border-bottom: none;
    color: #66d2a6;
    font-weight: 800;
    box-shadow: 10px -2px 4px 0px rgba(0, 0, 0, 0.07);
    border-radius: 15px 100px 0px 0px;
}

.tab-panel>input+h2 {
    transition: color 0.5s ease-in;
    -webkit-transition: color 0.5s ease-in;
}

.tab-panel>input:hover+h2 {
    color: white;
}

.tab-panel>input:checked:hover+h2 {
    color: #66d2a6;
}

@media screen and (max-width: 45em) {

    .tab-panel>input:checked+h2:nth-child(7),
    .tab-panel>input:checked+h2:nth-child(11) {
        border-top: none;
    }

    .tab-panel>input:checked+h2 {
        border-radius: 0px;
    }
}

.tab-panel>input:checked+h2+.tab-panel-content {
    position: static !important;
    padding: 24px !important;
    height: auto !important;
    width: auto !important;
}

.tab-panel .three-tabs {
    width: 33.33333%;
    left: 33.33333%;
}

.tab-panel .two-tabs {
    width: 50%;
    left: 50%;
}

.tab-panel .tab-title {
    margin: 0;
    text-align: center;
    background: #2cc185;
    color: #0d9564;
    box-sizing: border-box;
    border-radius: 15px 100px 0px 0px;
}

.tab-panel .tab-panel-content {
    background: #ffffff;
    border-bottom-left-radius: 6px;
    border-bottom-right-radius: 6px;
    /* min-height: 300px; */
}

@media screen and (max-width: 45em) {
    .tab-panel .tab-panel-content {
        display: block !important;
        position: static !important;
        padding: 1em !important;
        height: auto !important;
        width: auto !important;
    }
}

/* tab doc style */

.medic-pic {
    border-radius: 50%;
    width: 62%;
    height: 90%;
    margin: 0 auto;
}

.medic-content {
    padding: 2%;
}

.label-group {
    margin-bottom: 0.5em;
}

label {
    font-weight: 500;
}

input::placeholder {
    color: grey !important;
    font-size: 80%;
}

/* dropdown medic custom */
#medicSelect {
    background: none !important;
    border-radius: 4px;
    border: none !important;
}

/*table style */
/* *, *:before, *:after {

-webkit-box-sizing: border-box;

   -moz-box-sizing: border-box;

box-sizing: border-box;
}
html {

font-size: 1.125em;

width: 100%;

height: 100%;
}
body {

font-family: 'Roboto', sans-serif;

background: #f5f5f5;

color: #333;

-webkit-font-smoothing: antialiased;

line-height: 1.42857143;
  padding:1em;
} */
small {
    color: #808080;
}

/* button {

bottom:1px;
  cursor:pointer;
  margin-right:8px;
  position:relative;
  padding:4px 11px;
  border:1px solid #0085a6;
  background:none;
  border-radius:3px;
  color:#0085a6;
  font-size:1em;

transition:all .3s ease-in-out;
}
button:hover {background:#0085a6; color:#fff;} */

/* Tables */
/* Responsive scroll-y table */
.table-responsive {
    min-height: .01%;
    overflow-x: auto;
}

@media screen and (max-width: 801px) {
    .table-responsive {
        width: 100%;
        overflow-y: hidden;
        -ms-overflow-style: -ms-autohiding-scrollbar;
    }
}

/* Default table */
table {
    border-collapse: collapse;
    border-spacing: 0;
    -webkit-box-shadow: 0px 7px 6px -6px rgba(0, 0, 0, .28);
    -moz-box-shadow: 0px 7px 6px -6px rgba(0, 0, 0, .28);
    box-shadow: 0px 7px 6px -6px rgba(0, 0, 0, .28);
    margin-bottom: 40px;
    margin-top: 2em;
    /* margin-left: 2em;
  margin-right: 2em; */
    width: 100%;
    max-width: 100%;
}

table thead tr {
    border-bottom: 3px solid #0085a6;
    color: #000;
}

table tfoot tr {
    border-top: 3px solid #0085a6;
}

table thead th,
table tfoot th {
    background-color: #fff;
    color: #000;
    font-size: .83333em;
    line-height: 1.8;
    padding: 15px 14px 13px 14px;
    position: relative;
    text-align: center;
    text-transform: uppercase;
}

table tbody tr {
    background-color: #fff;
}

table tbody tr:hover {
    background-color: #eee;
    color: #000;
}

table th,
table td {
    border: 1px solid #bfbfbf;
    /* padding:10px 14px; */
    position: relative;
    vertical-align: middle;
}

caption {
    font-size: 1.111em;
    font-weight: 300;
    padding: 10px 0;
}

@media (max-width:1024px) {
    table {
        font-size: .944444em;
    }
}

@media (max-width:767px) {
    table {
        font-size: 1em;
    }
}

/* Responsive table full */
@media (max-width: 767px) {
    .table-responsive-full {
        box-shadow: none;
    }

    .table-responsive-full thead tr,
    .table-responsive-full tfoot tr {
        display: none;
    }

    .table-responsive-full tbody tr {
        -webkit-box-shadow: 0px 7px 6px -6px rgba(0, 0, 0, .28);
        -moz-box-shadow: 0px 7px 6px -6px rgba(0, 0, 0, .28);
        box-shadow: 0px 7px 6px -6px rgba(0, 0, 0, .28);
        margin-bottom: 20px;
    }

    .table-responsive-full tbody tr:last-child {
        margin-bottom: 0;
    }

    .table-responsive-full tr,
    .table-responsive-full td {
        display: block;
    }

    .table-responsive-full td {
        background-color: #fff;
        border-top: none;
        position: relative;
        padding-left: 50%;
    }

    .table-responsive-full td:hover {
        background-color: #eee;
        color: #000;
    }

    .table-responsive-full td:hover:before {
        color: hsl(0, 0%, 40%);
    }

    .table-responsive-full td:first-child {
        border-top: 1px solid #bfbfbf;
        border-bottom: 3px solid #0085a6;
        border-radius: 4px 4px 0 0;
        color: #000;
        font-size: 1.11111em;
        font-weight: bold;
    }

    .table-responsive-full td:before {
        content: attr(data-label);
        display: inline-block;
        color: hsl(0, 0%, 60%);
        font-size: 14px;
        font-weight: normal;
        margin-left: -100%;
        text-transform: uppercase;
        width: 100%;
        white-space: nowrap;
    }
}

@media (max-width: 360px) {
    .table-responsive-full td {
        padding-left: 14px;
    }

    .table-responsive-full td:before {
        display: block;
        margin-bottom: .5em;
        margin-left: 0;
    }
}

/* Sort table */
.sort-table-arrows {
    float: right;
    transition: .3s ease;
}

.sort-table-arrows button {
    margin: 0;
    padding: 4px 8px;
}

.sort-table th.title,
.sort-table th.composer {
    width: 20% !important;
}

.sort-table th.lyrics,
.sort-table th.arranger,
.sort-table th.set,
.sort-table th.info {
    width: 15% !important;
}

.sort-table .title {
    font-weight: bold;
}

.sort-table .title small {
    font-weight: normal;
}

@media (max-width:1024px) {

    .sort-table th,
    .sort-table-arrows {
        text-align: center;
    }

    .sort-table-arrows {
        float: none;
        padding: 8px 0 0;
        position: relative;
        right: 0px;
    }

    .sort-table-arrows button {
        bottom: 0;
    }
}

@media (max-width:767px) {
    .sort-table thead tr {
        border-bottom: none;
        display: block;
        margin: 10px 0;
        text-align: center;
    }

    .sort-table thead tr th.arranger {
        display: none;
    }

    .sort-table th {
        border-bottom: 1px solid #bfbfbf;
        border-radius: 4px;
        display: inline-block;
        font-size: .75em;
        line-height: 1;
        margin: 3px 0;
        padding: 10px;
    }

    .sort-table th.title,
    .sort-table th.composer,
    .sort-table th.lyrics,
    .sort-table th.set,
    .sort-table th.info {
        width: 100px !important;
    }

    .sort-table td.title:before {
        display: none;
    }

    .sort-table td.title {
        letter-spacing: .03em;
        padding-left: 14px;
    }
}

/* custom label */
.hidden {
    color: white !important;
    padding-left: 50px !important;
}

.table-center {
    margin-left: auto;
    margin-right: auto;
}

.card.vacts {
    width: 100%;
}
</style>
