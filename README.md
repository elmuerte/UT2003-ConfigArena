# UT2003-ConfigArena

ConfigArena is just a subclass of the Arena mutator. The only diffirence is that this mutator can be configured via the WebAdmin.

Just extract the ConfigArena.u and ConfigArena.int file to your system directory.
To use this mutator just select ConfigArena or use the following on the commandline:

```
?Mutator=ConfigArena.ConfigArena
```

To change the weapon used in the Arena enter the WebAdmin, on the page Defaults->Game you will have a new option: "Weapon Arena" here you can select the weapon used in the Arena.
NOTE!: You have to restart the server before the new weapon is used

New in versions 101:
- changed the way the weapon list is constructed, it should now also work with mods like Ladder. 
