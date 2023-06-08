*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${url}    https://www.ebay.com/
${browser}    gc
${locator_search}    id=gh-ac
${locator_btn_search}    id=gh-btn
${locator_categories}    id=gh-cat
${locator_result_number}    xpath=//*[@id="mainContent"]/div[1]/div[2]/div[2]/div[1]/div[1]/h1/span[1]
${locator_name_product}    xpath=//*[@id="item4df268cc70"]/div/div[2]/a/div/span
${locator_checkbox_brand}    xpath=//*[@id="x-refine__group_1__4"]/ul/li[1]/div/a/div/span/input
${locator_condition}    xpath=//*[@id="x-refine__group__2"]/ul/li[1]/div/a/div/span/input
${locator_price}    xpath=//*[@id="s0-53-16-0-1-2-6-1-8[3]"]/li[1]/div/a/div/span/input
