<#import "template.ftl" as layout>
<#assign templateName = "register.ftl"/>
<#include "template.ftl"/>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("registerWithTitle",(realm.name!''))}
    <#elseif section = "header">
         ${msg("registerWithTitleHtml",(realm.name!''))}
    <#elseif section = "form">
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
          <#if !realm.registrationEmailAsUsername>
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="username" class="${properties.kcLabelClass!}">${msg("username")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="username" class="${properties.kcInputClass!}" name="username" value="${(register.formData.username!'')}" />
                </div>
            </div>
          </#if>
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="firstName" class="${properties.kcLabelClass!}">${msg("firstName")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="firstName" placeholder="${msg('placeholderName')}" class="${properties.kcInputClass!}" name="firstName" value="${(register.formData.firstName!'')}" />
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="lastName" placeholder="${msg('placeholderSurname')}" class="${properties.kcInputClass!}" name="lastName" value="${(register.formData.lastName!'')}" />
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="email" placeholder="${msg('placeholderEmail')}" class="${properties.kcInputClass!}" name="email" value="${(register.formData.email!'')}" />
                </div>
            </div>

            <#if passwordRequired>
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="password" id="password" placeholder="${msg('placeholderPassword')}" class="${properties.kcInputClass!}" name="password" />
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="password-confirm" class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="password" id="password-confirm" placeholder="${msg('placeholderPassword')}" class="${properties.kcInputClass!}" name="password-confirm" />
                </div>
            </div>

            <#-- Add a new section for AGB acceptance -->
            <div class="form-group-checkbox">
                <div class="checkbox-container">
                    <input type="checkbox" id="acceptTerms" name="acceptTerms" required>
                    <label for="acceptTerms" class="checkbox-label">${msg("acceptTerms")}</label>
                </div>
                <a href="${msg('urlToTermsOfUse')}" target="_blank">${msg("termsOfService")}</a>
            </div>
            </#if>
            <#--  
            <div class="form-group">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="user.attributes.street" class="${properties.kcLabelClass!}">${msg("street")}</label>
                </div>

                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" class="${properties.kcInputClass!}"  id="user.attributes.street" name="user.attributes.street" value="${(register.formData['user.attributes.street']!'')}"/>
                </div>
            </div>
            <div class="form-group">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="user.attributes.locality" class="${properties.kcLabelClass!}">${msg("locality")}</label>
                </div>

                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" class="${properties.kcInputClass!}"  id="user.attributes.locality" name="user.attributes.locality" value="${(register.formData['user.attributes.locality']!'')}"/>
                </div>
            </div>
            <div class="form-group">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="user.attributes.region" class="${properties.kcLabelClass!}">${msg("region")}</label>
                </div>

                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" class="${properties.kcInputClass!}"  id="user.attributes.region" name="user.attributes.region" value="${(register.formData['user.attributes.region']!'')}"/>
                </div>
            </div>
            <div class="form-group">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="user.attributes.postal_code" class="${properties.kcLabelClass!}">${msg("postal_code")}</label>
                </div>

                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" class="${properties.kcInputClass!}"  id="user.attributes.postal_code" name="user.attributes.postal_code" value="${(register.formData['user.attributes.postal_code']!'')}"/>
                </div>
            </div>
            <div class="form-group">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="user.attributes.country" class="${properties.kcLabelClass!}">${msg("country")}</label>
                </div>

                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" class="${properties.kcInputClass!}"  id="user.attributes.country" name="user.attributes.country" value="${(register.formData['user.attributes.country']!'')}"/>
                </div> -->
            </div>  
            <#if recaptchaRequired??>
            <div class="form-group">
                <div class="${properties.kcInputWrapperClass!}">
                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                </div>
            </div>
            </#if>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <span><a href="${url.loginUrl}">${msg("backToLogin")?no_esc}</a></span>
                    </div>
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doRegister")}"/>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>