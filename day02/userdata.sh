#!/bin/bash
sudo apt update
# sudo apt install -y apache2
sudo apt install -y nginx

# Get the instance ID using the instance metadata
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

# Install the AWS CLI
#apt install -y awscli

# Download the images from S3 bucket
#aws s3 cp s3://myterraformprojectbucket2023/project.webp /var/www/html/project.png --acl public-read

# Create a simple HTML file with the portfolio content and display the images
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DevSecOps</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

    <style>
        .gradient-custom-2 {
    
            background: #fccb90;

      
            background: -webkit-linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593);

      
            background: linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593);
        }

        @media (min-width: 768px) {
            .gradient-form {
                height: 100vh !important;
            }
        }

        @media (min-width: 769px) {
            .gradient-custom-2 {
                border-top-right-radius: .3rem;
                border-bottom-right-radius: .3rem;
            }
        }
    </style>
</head>

<body>
    <section class="h-100 gradient-form" style="background-color: #eee;">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-xl-10">
                    <div class="card rounded-3 text-black">
                        <div class="row g-0">
                            <div class="col-lg-6">
                                <div class="card-body p-md-5 mx-md-4">

                                    <div class="text-center">
                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/lotus.webp"
                                            style="width: 185px;" alt="logo">
                                        <h4 class="mt-1 mb-5 pb-1">We are DevSecOps Team</h4>
                                        <h4 class="mt-1 mb-5 pb-1">Pradeep Kadam! Aspiring DevSecOps Engineer |
                                            Committed to Bridging Security with Innovation</h4>
                                    </div>

                                    <form>
                                        <p>Signup </p>
                                        <div class="form-outline mb-4">
                                            <input type="email" id="form2Example11" class="form-control"
                                                placeholder="First Name" />
                                            <label class="form-label" for="form2Example11"></label>
                                        </div>
                                        <div class="form-outline mb-4">
                                            <input type="email" id="form2Example11" class="form-control"
                                                placeholder="Last Name" />
                                            <label class="form-label" for="form2Example11"></label>
                                        </div>
                                        <div class="form-outline mb-4">
                                            <input type="email" id="form2Example11" class="form-control"
                                                placeholder="Phone Number" />
                                            <label class="form-label" for="form2Example11"></label>
                                        </div>



                                        <div class="form-outline mb-4">
                                            <input type="email" id="form2Example11" class="form-control"
                                                placeholder="Email address" />
                                            <label class="form-label" for="form2Example11"></label>

                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="text" id="form2Example22" class="form-control"
                                                placeholder="Address" />
                                            <label class="form-label" for="form2Example22"></label>
                                        </div>
                                        <div class="radio form-outline mb-4">
                                            <label for="gender">
                                                <p class="form-outline mb-4">Gender:</p>
                                                <label for="gender01">
                                                    <input type="radio" name="gender" id="gender01"> Male</input>
                                                </label>
                                                <label for="gender02">
                                                    <input type="radio" name="gender" id="gender02"> Female </input>
                                                </label>
                                            </label>
                                        </div>
                                        <div class="text-center pt-1 mb-5 pb-1">
                                            <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3"
                                                type="button">Signup</button>
                                            <a class="text-muted" href="#">Forgot password?</a>
                                        </div>

                         

                                    </form>

                                </div>
                            </div>
                            <div class="col-lg-6 d-flex align-items-top gradient-custom-2 bg-primary">
                                <div class="text-white px-3 py-4 p-md-5 mx-md-4">
   
                                    <h3>Terraform + AWS </h3>
                                    <h4>Linux + Github + Terraform + EC2 + VPC + SG + Nginx / apache2</h4>
                                    <h5>Instance ID: $INSTANCE_ID</h5>
 
                                    <p class="small mb-0">🚀 Excited to share some thrilling news! 🎉 Our DevSecOps team
                                        is on fire 🔥 with innovation and unstoppable momentum! 🌟
                                        </br></br>
                                        🛠️ Here's why you should be just as pumped as we are:
                                        </br></br>
                                        </br>Seamlessly merging security with development and operations 💻🔒
                                        </br> Accelerating software delivery like never before ⏩🚀
                                        </br> Elevating collaboration to new heights across teams and departments 🤝💼
                                        </br> Join us in revolutionizing the tech industry! 💥 Let's pave the way to a
                                        more secure, efficient, and collaborative future together. 💪✨
                                        </br>
                                        </br> #DevSecOps #Innovation #Collaboration #TechTrends #SoftwareDelivery
                                        #TeamWork #Efficiency #SecurityFirst #DigitalTransformation
                                        #ContinuousIntegration</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
EOF

# Start Apache and enable it on boot
# sudo systemctl enable apache2
# sudo systemctl start apache2
#sudo systemctl restart apache2
sudo systemctl enable nginx
sudo systemctl start nginx
#sudo systemctl restart apache2