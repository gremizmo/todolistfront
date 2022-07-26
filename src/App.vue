<template>
  <Header />
  <div class="container p-5">
    <h3 class="text-center mt-2 mb-5">showOffList.com</h3>
    <div class="col-md-12">

      <form v-on:submit.prevent="login_user">

        <div class="mb-3">
          <label for="exampleFormControlInput2" class="form-label">Enter Email</label>
          <input type="text" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email" v-model="form.email">
        </div>
        <div class="mb-3">
          <label for="exampleFormControlInput3" class="form-label">Enter Password</label>
          <input type="password" name="password" class="form-control" id="exampleInputPass1" aria-describedby="passHelp" placeholder="Enter Password" v-model="form.password">
        </div>


        <button type="submit" class="btn btn-primary mt-5">Submit</button>
      </form>
    </div>
  </div>
  <Footer />
</template>
<script>
import "bootstrap/dist/css/bootstrap.min.css";
import axios from 'axios'
import Swal from 'sweetalert2'
export default {
  components: {
  },
  data(){
    return {

      form:{
        email: '',
        password: ''

      }
    }
  },
  methods:{
    //user login function and api call
    login_user(){
      axios
          .post('http://localhost:8000/api/v1/auth/login',this.form)
          .then((resp) =>{
            this.form.email = '';
            this.form.password = '';
            if(resp["data"]["status"] === "error")
            {
              Swal.fire({
                title: 'OPPS',
                text:   "error",
                icon: 'warning',

              });
            }
            else
            {
              Swal.fire({
                title: 'Hurry',
                text:   "You have been logged-in successfully",
                icon: 'success',

              });
            }

          })
          .catch((e)=>{
            console.log(e);
            Swal.fire({
              title: 'Hurry',
              text:   e,
              icon: 'warning',

            });
          })
    }
  }
}
</script>