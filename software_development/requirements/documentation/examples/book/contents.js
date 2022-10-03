"use strict";

var contents = document.querySelectorAll("[contents] li");

var contents = Array.from(contents).map(
    function(element)
    {
        return {
            link: element.firstElementChild,
            number: element.firstElementChild.lastElementChild
        };
    }
);

var pages = Array.from(document.querySelectorAll("div[page]"));

for(var element of contents)
{
    var reference = element.link.getAttribute("href").substring(1);
    var referenced = document.getElementById(reference);

    var referenced_page = pages.find(
        function(element_)
        {
            return element_.contains(referenced);
        }
    );

    var page_number = pages.indexOf(referenced_page) + 1;
    element.number.innerText = page_number;
}
