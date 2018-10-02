new Vue({
    el:"#show-ex1",
    data:{
        name:"Sattaya Singkul",
        nick_name:"Joe",
        age:22,
        status: false,
        count:0,
        stringInput:"",
        website: 'https://www.google.com',
        hobbies:[],
        gender:"",
        job:"",
        job_other_status:false
    },
    methods:{
        getName:function(){
            return this.name
        },
        setName:function(newName){
            this.name = newName
        },
        addAge:function(){
            this.age++;
            console.log(this.age);
        },
        subAge:function(){
            this.age--;
            console.log(this.age);
        },
        addCount:function(){
            this.count++;
            console.log(this.age);
        },
        stringCount:function(){
            console.log(this.stringInput.length)
            return this.stringInput.length;
        }
    }
})

new Vue({
    el:"#show-adapt1",
    data:{
        name:"Sattaya Singkul",
        nick_name:"Joe",
        age:22,
        status: false
    },
    methods:{
        getName:function(){
            return this.name
        },
        setName:function(newName){
            this.name = newName
        }
    }
})