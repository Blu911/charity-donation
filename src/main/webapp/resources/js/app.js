document.addEventListener("DOMContentLoaded", function () {
    /**
     * HomePage - Help section
     */
    class Help {
        constructor($el) {
            this.$el = $el;
            this.$buttonsContainer = $el.querySelector(".help--buttons");
            this.$slidesContainers = $el.querySelectorAll(".help--slides");
            this.currentSlide = this.$buttonsContainer.querySelector(".active").parentElement.dataset.id;
            this.init();
        }

        init() {
            this.events();
        }

        events() {
            /**
             * Slide buttons
             */
            this.$buttonsContainer.addEventListener("click", e = > {
                if(e.target.classList.contains("btn")
        )
            {
                this.changeSlide(e);
            }
        })
            ;

            /**
             * Pagination buttons
             */
            this.$el.addEventListener("click", e = > {
                if(e
                .target.classList.contains("btn") && e.target.parentElement.parentElement.classList.contains("help--slides-pagination")
        )
            {
                this.changePage(e);
            }
        })
            ;
        }

        changeSlide(e) {
            e.preventDefault();
            const $btn = e.target;

            // Buttons Active class change
            [...this.$buttonsContainer.children
        ].
            forEach(btn = > btn.firstElementChild.classList.remove("active")
        )
            ;
            $btn.classList.add("active");

            // Current slide
            this.currentSlide = $btn.parentElement.dataset.id;

            // Slides active class change
            this.$slidesContainers.forEach(el = > {
                el.classList.remove("active");

            if (el.dataset.id === this.currentSlide) {
                el.classList.add("active");
            }
        })
            ;
        }

        /**
         * TODO: callback to page change event
         */
        changePage(e) {
            e.preventDefault();
            const page = e.target.dataset.page;

            console.log(page);
        }
    }

    const helpSection = document.querySelector(".help");
    if (helpSection !== null) {
        new Help(helpSection);
    }

    /**
     * Form Select
     */
    class FormSelect {
        constructor($el) {
            this.$el = $el;
            this.options = [...$el.children
        ]
            ;
            this.init();
        }

        init() {
            this.createElements();
            this.addEvents();
            this.$el.parentElement.removeChild(this.$el);
        }

        createElements() {
            // Input for value
            this.valueInput = document.createElement("input");
            this.valueInput.type = "text";
            this.valueInput.name = this.$el.name;

            // Dropdown container
            this.dropdown = document.createElement("div");
            this.dropdown.classList.add("dropdown");

            // List container
            this.ul = document.createElement("ul");

            // All list options
            this.options.forEach((el, i) = > {
                const li = document.createElement("li");
            li.dataset.value = el.value;
            li.innerText = el.innerText;

            if (i === 0) {
                // First clickable option
                this.current = document.createElement("div");
                this.current.innerText = el.innerText;
                this.dropdown.appendChild(this.current);
                this.valueInput.value = el.value;
                li.classList.add("selected");
            }

            this.ul.appendChild(li);
        })
            ;

            this.dropdown.appendChild(this.ul);
            this.dropdown.appendChild(this.valueInput);
            this.$el.parentElement.appendChild(this.dropdown);
        }

        addEvents() {
            this.dropdown.addEventListener("click", e = > {
                const target = e.target;
            this.dropdown.classList.toggle("selecting");

            // Save new value only when clicked on li
            if (target.tagName === "LI") {
                this.valueInput.value = target.dataset.value;
                this.current.innerText = target.innerText;
            }
        })
            ;
        }
    }

    document.querySelectorAll(".form-group--dropdown select").forEach(el = > {
        new FormSelect(el);
})
    ;

    /**
     * Hide elements when clicked on document
     */
    document.addEventListener("click", function (e) {
        const target = e.target;
        const tagName = target.tagName;

        if (target.classList.contains("dropdown")) return false;

        if (tagName === "LI" && target.parentElement.parentElement.classList.contains("dropdown")) {
            return false;
        }

        if (tagName === "DIV" && target.parentElement.classList.contains("dropdown")) {
            return false;
        }

        document.querySelectorAll(".form-group--dropdown .dropdown").forEach(el = > {
            el.classList.remove("selecting");
    })
        ;
    });

    /**
     * Switching between form steps
     */
    class FormSteps {
        constructor(form) {
            this.$form = form;
            this.$next = form.querySelectorAll(".next-step");
            this.$prev = form.querySelectorAll(".prev-step");
            this.$step = form.querySelector(".form--steps-counter span");
            this.currentStep = 1;

            this.$stepInstructions = form.querySelectorAll(".form--steps-instructions p");
            const $stepForms = form.querySelectorAll("form > div");
            this.slides = [...this.$stepInstructions,
        ...
            $stepForms
        ]
            ;

            this.init();
        }

        /**
         * Init all methods
         */
        init() {
            this.events();
            this.updateForm();
        }

        /**
         * All events that are happening in form
         */

        events() {
            // Next step
            this.$next.forEach(btn = > {
                btn.addEventListener("click", e = > {
                    e.preventDefault();
            if (this.validate()) {
                this.currentStep++;
                this.updateForm();
            }
        })
            ;
        })
            ;

            // Previous step
            this.$prev.forEach(btn = > {
                btn.addEventListener("click", e = > {
                    e.preventDefault();
            this.currentStep--;
            this.updateForm();
        })
            ;
        })
            ;

            // Form submit
            this.$form.querySelector("form").addEventListener("submit", e = > this.submit(e)
        )
            ;
        }

        /**
         * Validate form front-end
         */
        validate() {

            if (this.currentStep === 1) {
                // Form First Step
                var checkboxElements = document.getElementsByClassName("whatToDonate");
                var countChecked = 0;
                for (var i = 0; i < checkboxElements.length; i++) {
                    if (checkboxElements[i].checked) {
                        countChecked++
                    }
                }
                if (countChecked > 0) {
                    return true;
                } else {
                    alert("Zaznacz co najmniej jedną z opcji");
                    return false;
                }

            } else if (this.currentStep === 2) {
                // Form Second Step
                var quantityElement = document.getElementById("bagQuantity");
                if (quantityElement.value <= 0) {
                    alert("Minimalna ilośc worków to 1");
                    return false;
                } else {
                    return true;
                }

            } else if (this.currentStep === 3) {
                // Form Third Step
                var radioElements = document.getElementsByClassName("institution");
                var countChecked = 0;
                for (var i = 0; i < radioElements.length; i++) {
                    if (radioElements[i].checked) {
                        countChecked++
                    }
                }
                if (countChecked > 0) {
                    return true;
                } else {
                    alert("Zaznacz jedną z organizacji");
                    return false;
                }

            } else if (this.currentStep === 4) {
                // Form Fourth Step
                var errorCounter = 0;

                var houseNumber = document.getElementById("houseNumber");
                var errorHouseNumber = document.getElementById('errorHouseNumber');
                if (!houseNumber.value.match(/^\d+$/)) {
                    errorHouseNumber.innerHTML = "Wartość nie może być mniejsza niż 1";
                    errorCounter++;
                } else {
                    errorHouseNumber.innerHTML = "";
                }

                var flatNumber = document.getElementById("flatNumber");
                var errorFlatNumber = document.getElementById('errorFlatNumber');
                if (flatNumber.value !== "") {
                    if (!flatNumber.value.match(/^\d+$/)) {
                        errorFlatNumber.innerHTML = "Wartość nie może być mniejsza niż 1";
                        errorCounter++;
                    } else {
                        errorFlatNumber.innerHTML = "";
                    }
                } else {
                    errorFlatNumber.innerHTML = "";
                }

                var street = document.getElementById("street");
                var errorStreet = document.getElementById('errorStreet');
                if (!street.value.match(/^[a-zA-Z\u0080-\u024F\s\/\-\)\(\`\.\"\']+$/)) {
                    errorStreet.innerHTML = "Nazwa ulicy jest nie poprawna";
                    errorCounter++;
                } else {
                    errorStreet.innerHTML = "";
                }


                var city = document.getElementById("city");
                var errorCity = document.getElementById('errorCity');
                if (!city.value.match(/^[a-zA-Z\u0080-\u024F\s\/\-\)\(\`\.\"\']+$/)) {
                    errorCity.innerHTML = "Nazwa miasta jest nie poprawna";
                    errorCounter++;
                } else {
                    errorCity.innerHTML = "";
                }

                var zipCode = document.getElementById("zipCode");
                var errorZipCode = document.getElementById('errorZipCode');
                if (!zipCode.value.match(/^[\d]{2}-[\d]{3}$/)) {
                    errorZipCode.innerHTML = "Pole musi zawierać liczby w formacie XX-XXX";
                    errorCounter++;
                } else {
                    errorZipCode.innerHTML = "";
                }

                return errorCounter <= 0;

            }
        }

        /**
         * Update form front-end
         * Show next or previous section etc.
         */
        updateForm() {
            this.$step.innerText = this.currentStep;
            this.slides.forEach(slide = > {
                slide.classList.remove("active");

            if (slide.dataset.step == this.currentStep) {
                slide.classList.add("active");
            }
        })
            ;

            this.$stepInstructions[0].parentElement.parentElement.hidden = this.currentStep >= 6;
            this.$step.parentElement.hidden = this.currentStep >= 6;
            // TODO: get data from inputs and show them in summary
        }

        /**
         * Submit form
         *
         * TODO: validation, send data to server
         */
        submit(e) {
            // e.preventDefault();
            this.currentStep++;
            this.updateForm();
        }
    }

    const form = document.querySelector(".form--steps");
    if (form !== null) {
        new FormSteps(form);
    }

});


/**
 * Go back - button
 */
// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function () {
    scrollFunction()
};

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        document.getElementById("myBtn").style.display = "block";
    } else {
        document.getElementById("myBtn").style.display = "none";
    }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
    document.body.scrollTop = 0; // For Safari
    document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}
