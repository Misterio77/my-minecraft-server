# Translations and Language Files

This is just a quick file that explains how can customize or add translations for this plugin and find which ones exist.  
(There's a nice rendered (and possibly more up to date) version of this file here:
https://github.com/AuraDevelopmentTeam/MessagesTranslator/wiki/Translations-and-Language-Files)

## Directory structure and files

So we have this current file tree (note `.lang` files are just examples):

```
. <--------------------------------- Translations base folder
├── builtin
│   ├── _DO_NOT_EDIT_THESE_FILES
│   ├── _SEE_README_IN_PARENT_DIR
│   ├── de_DE.lang
│   └── en_US.lang
├── _README.md <-------------------- You are here
├── custom.lang
├── en_US.lang
└── fr_FR.lang
```

- The files in the `builtin` folder are built in translation files. **They will updated automatically on every restart and reload!**  
  ***DO NOT EDIT THEM!!!***  
  Instead use them as reference to what language keys exist (see [Language File Format](#language-file-format) for they work) and for you to know what languages
  exist. Also do not add any files in that folder as it might be overridden or removed!
- The files in the translations base folder (the one this file is in) are for translation customizations or custom translations. The plugin will never touch
  them (except this README file).

### Customizations and Overrides

You can customize or override some or all translation keys in an existing file. Just create a translation file with the same name as the one you'd like to
override in the translation base folder.  
So if you wanted to change the help message of the `en_US` translation, create a file named `en_US.lang` in the translations base folder (like in the example)
and add the translation key you want to override with your changed text. Then if your language is still set to `en_US`, it will pick up this override after a
restart or reload (if the plugin offers a reload).

### Custom Translation Files

You can add any translation file to the translations base folder you want and name them whatever you want. The only requirement is that the file has the `.lang`
extension. So file names like `en_GB.lang`, `en.lang`, `klingon.lang`, `banana.lang` and `I AM RUNNING OUT OF IDEAS SO HERE IS A LONG FILE NAME.lang` are
perfectly file. Just be sure to follow roughly the same format as the built in examples.  
And to select a language, just use the file name without the `.lang` extension (So `klingon.lang` becomes `klingon` in the config).

## Language File Format

- Everything behind a `#` is considered to be a comment and will be ignored. A line may start with it or it may follow after a translation key.
- A translation key looks like this `key: "Text"`. While the text can be changed to anything you want, the keys are predefined by the plugin and must remain
  unmodified.  
  While not strictly necessary for all texts, it's highly recommended to wrap the text in `"`s. The space after the key is optional but recommended as well.
- You can inherit from another translation by using the `inherit: lang` key (For example: `inherit: en_US`).  
  This is useful for future proofing your translation or if you're just creating a (national/regional) variation of an existing language (like `en_GB`).
  Inheriting means that all translation keys that you did not define will be taking from the translation that you inherit from. So if your base translation has
  a translation you want to keep, just don't specify it. It's useful for future proofing for the case that new translation keys are added in the future and your
  translation is hence missing them.  
  If you don't specify inheritance your translation will inherit the master translation, which is `en_US`.

## A Few Notes

- This file and the whole translation logic is added by an [external library](https://github.com/AuraDevelopmentTeam/MessagesTranslator). That's why there may
  be slight mismatches or why the file tree further up shows files that don't exist has missing files.
- Also because this is a library, the plugin author has no control over implementation details like what the master language is or the `.lang` file format.
  Don't yell at them, yell at me, alright? ;)
- The actual translations shipped by the plugin are typically made by volunteers. So if they are not up to date or missing, it would be awesome if you updated
  them or created them and sent them the plugin author. That's always awesome. And if the plugin author(s) are not happy about you updating or creating a
  translation, then you can yell at them, deal?
- If you want syntax highlighting, use YAML or HOCON. (It's technically HOCON, but YAML works too if you're being strict with the format)
- You can make cool ASCII art banners on this site: http://patorjk.com/software/taag/  
  My favorite style for language files is this one: http://patorjk.com/software/taag/#h=0&v=0&c=bash&f=Standard
