# Sinatra Project: Software Localization

The Software Localization project is a web tool that software developers can use to enter text strings and receive the text back translated into the supported languages. Localization for software terms is important so you do not use a translation that means something outside the scope of software functionality.

For example: A user can go to the website and enter a string of text like "Save As". The Software Localization website will store a database of common translations in multiple languages and will search this database for the text that was entered. If found, the website will return the entered text, along with the text translated into any supported language. If not found it will use the Microsoft Translator API to offer alternative translations.

They can also add text suggestions and translations into a separate table of the database so users can have a third option: search based on feedback from other users.


## API Used

**Microsoft Translator:**
http://www.microsoft.com/translator/translator-api.aspx
Microsoft Translator is a machine translation service. The service translates a "source" text from one language to a different "target" language. The free API allows up to 2 million character translations per month and should be acceptable for the project.


## Gem Used

**microsoft_translator:**
https://github.com/ikayzo/microsoft_translator
Ruby wrapper for Microsoft Translate HTTP API. Currently only supports translating one string of text at a time, which is acceptable for this project.


## "Should" cases

**Here's what I want to do:**

Store a database of common translations
Search database for matching text
Use Microsoft Translator API as alternative when database search returns nothing
Use microsoft_translator gem to interact with Microsoft Translator
Add new translation records by user
Separate search of user database for matching text

**OPTIONAL:**
Use a second gem called bad_word_detector to filter offensive language for the user created language table:
https://rubygems.org/gems/bad_word_detector

## Models

**1) One-to-many relationship:**
Main web page where the user enters text for translation. There can only be a single text string, but many language options.

**2) Many-to-many relationship:**
With the Microsoft Translator API there are many languages with many variations in translation (for example, "save" may return many different translations based on meaning outside of sofware usage scope).

**3) One-to-many relationship:**
With the user database option, there will be a single text string and options to add a single or multiple translations (available text fields for each supported language, so the user can enter a single language translation or more if they know more than one foreign language).