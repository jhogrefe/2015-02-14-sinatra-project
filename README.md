# Sinatra Project: Software Localization

The Software Localization project is a web tool that software developers can use to enter text strings and receive the text back translated into the supported languages. Localization for software terms is important so you do not use a translation that means something outside the scope of software functionality.

For example: A user can go to the website and enter a string of text like "Save As". The Software Localization website will store a database of common translations in multiple languages (french, spanish, german, italian) and will search this database for the text that was entered. If found, the website will return the entered text, along with the text translated into any supported language. If not found it will use the Microsoft Translator API to offer alternative translations.

**OPTIONAL:**
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

 * Store a table of common translations in the database (software_translations table with id and word currently as column headers). This will be created by me. I am not sure if it is allowed to hard code core languages as their own attribute variables (each having their own column to hold translation values): @french, @spanish, @german, @italian. I would want these to exist in the table no matter what so I could keep some core translations for each word record.
 * Ability to search the software_translation table in the database for matching word or text string, which will return the translated text to the user.
 * Use Microsoft Translator API as alternative when searching the table in my database returns nothing.
 * Use microsoft_translator gem to interact with Microsoft Translator.
 * OPTIONAL: Add new translation records by user in their own table of the database. For example, a user who speaks French may want to add a new text record for "Save as PDF" in French; they can enter the English and French versions and submit to add to the user table of the database.
 * OPTIONAL: Separate search of translations entered by users in their own table of the database for matching text. If a user doesn't find a translation of their text when doing a search in the main table of the database (created by me), they have the option to search the user table of the database for the translations.

**OPTIONAL:**
Use a second gem called bad_word_detector to filter offensive language for the user created language table:
https://rubygems.org/gems/bad_word_detector

## Models

**1) One-to-many relationship:**
Main web page where the user enters text for translation. There can only be a single text string, but many language options.

**2) One-to-many relationship:**
With the Microsoft Translator API there are many languages with many variations in translation (for example, "save" may return many different translations based on meaning outside of sofware usage scope) but only a single string of text can be searched at a time.

**3) OPTIONAL: One-to-many relationship:**
With the user database option, there will be a single text string and options to add a single or multiple translations (available text fields for each supported language, so the user can enter a single language translation or more if they know more than one foreign language).