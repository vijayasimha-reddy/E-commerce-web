<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 8vh;
        }

        .sidebar {
            background-color: #f9f9f9;
            border-right: 1px solid #ddd;
            padding: 20px;
        }

        .sidebar a {
            display: block;
            padding: 8px;
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }

        .sidebar a.active {
            background-color: #ccecd9;
            font-weight: bold;
        }

        .highlight-box {
            background-color: #8cd60e;
            color: black;
            font-weight: bold;
            padding: 8px 16px;
            display: inline-block;
            margin-top: 10px;
        }

        .office-address, .row {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
        }

        .col-md-9, .col-md-3 {
            margin-top: 8vh;
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp"/>

    <div class="container">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 sidebar">
                <h5>About Us</h5>
                <a onclick="showContent('contact', this)" class="active">Contact Us</a>
                <a onclick="showContent('about', this)">About Eco_Basketry</a>
                <a onclick="showContent('why', this)">Why shop at Eco_Basketry?</a>
                <a onclick="showContent('order', this)">How to order</a>
                <a onclick="showContent('privacy', this)">Privacy Policy</a>
                <a onclick="showContent('terms', this)">Terms & Conditions</a>
                <a onclick="showContent('faq', this)">FAQs</a>
            </div>

            <!-- Main Content Area -->
            <div class="col-md-9">
                <h3 id="content-title">Contact Us</h3>
                <div id="content-area">
                    <p>To reach our customer service team, please email us at:
                        <a href="mailto:customerservice@ecobasketry.com">customerservice@ecobasketry.com</a>
                    </p>
                    <p>To submit a customer service request, <a href="#">click here</a>.</p>
                    <p class="text-muted">
                        [All calls to our customer support number 080-45678765 will be recorded for internal training and quality purposes.]
                    </p>

                    <h4 class="mt-4">Office Address:</h4>
                    <div class="highlight-box">BANGALORE</div>

                    <div class="office-address mt-3">
                        <p><strong>Eco_basketry</strong><br>
                        17th Cross Rd, MRCR Layout,<br>
                        MC Layout, Vijayanagar,<br>
                        Bengaluru, Karnataka 560040<br>
                        <span style="color:red;">Tel: 080-45678765</span></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Simple JavaScript -->
    <script>
        function showContent(type, element) {
            // Remove 'active' from all sidebar links
            const links = document.querySelectorAll(".sidebar a");
            links.forEach(link => link.classList.remove("active"));
            element.classList.add("active");

            // Set content based on type
            const title = document.getElementById("content-title");
            const content = document.getElementById("content-area");

            if (type === "contact") {
                title.innerText = "Contact Us";
                content.innerHTML = `
                    <p>To reach our customer service team, please email us at:
                        <a href="mailto:customerservice@ecobasketry.com">customerservice@ecobasketry.com</a>
                    </p>
                    <p>To submit a customer service request, <a href="#">click here</a>.</p>
                    <p class="text-muted">
                        [All calls to our customer support number 080-45678765 will be recorded for internal training and quality purposes.]
                    </p>
                    <h4 class="mt-4">Office Address:</h4>
                    <div class="highlight-box">BANGALORE</div>
                    <div class="office-address mt-3">
                        <p><strong>Eco_basketry</strong><br>
                        17th Cross Rd, MRCR Layout,<br>
                        MC Layout, Vijayanagar,<br>
                        Bengaluru, Karnataka 560040<br>
                        <span style="color:red;">Tel: 080-45678765</span></p>
                    </div>
                `;
            } else if (type === "about") {
                title.innerText = "About Eco_Basketry";
                content.innerHTML = "<p>Eco_Basketry is a sustainable brand promoting handmade baskets crafted by local artisans using eco-friendly materials.</p>";
            } else if (type === "why") {
                title.innerText = "Why Shop at Eco_Basketry?";
                content.innerHTML = "<p>We offer eco-friendly products, support local artisans, and ensure ethical practices throughout our supply chain.</p>";
            } else if (type === "order") {
                title.innerText = "How to Order";
                content.innerHTML = "<p>Browse products, add them to your cart, and follow our secure checkout process. Orders are processed within 2 business days.</p>";
            } else if (type === "privacy") {
                title.innerText = "Privacy Policy";
                content.innerHTML = "<p>We respect your privacy. Your information is stored securely and never shared without your permission.</p>";
            } else if (type === "terms") {
                title.innerText = "Terms & Conditions";
                content.innerHTML = "<p>By using our site, you agree to our policies regarding returns, refunds, and acceptable use. Read the full terms carefully.</p>";
            } else if (type === "faq") {
                title.innerText = "FAQs";
                content.innerHTML = `
                    <p><strong>Q:</strong> What is your return policy?<br>
                    <strong>A:</strong> Returns are accepted within 15 days of delivery.</p>
                    <p><strong>Q:</strong> Do you offer international shipping?<br>
                    <strong>A:</strong> Yes, we ship to selected countries. Charges may apply.</p>
                `;
            }
        }
    </script>
</body>
</html>