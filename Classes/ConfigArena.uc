///////////////////////////////////////////////////////////////////////////////
// filename:    ConfigArena.uc
// version:     101
// author:      Michiel 'El Muerte' Hendriks <elmuerte@drunksnipers.com>
// purpose:     A configurable Arena mutator
///////////////////////////////////////////////////////////////////////////////

class ConfigArena extends MutArena config;

var config string WeaponList;

function string getWeaponList()
{
  local string result;
  local string WeaponClass;
  local class<Weapon> Weapon;
  local int i;

  i = 0;
  WeaponClass = GetNextInt("Engine.Weapon",i);
  while (WeaponClass != "")
	{
    weapon = class<weapon>(DynamicLoadObject(WeaponClass,Class'Class',true));
    if (weapon != none)
    {
      result = result$WeaponClass$";"$weapon.default.ItemName$";";
    }
    WeaponClass = GetNextInt("Engine.Weapon",++i);
  }
  return result;
}

event PreBeginPlay()
{
  Default.WeaponList = getWeaponList();
  StaticSaveConfig();
}

static function string StaticGetWeaponList()
{
  if (Default.WeaponList != "") return Default.WeaponList;
  else return Default.ArenaWeaponClassName$";not initialised;";
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
  super.FillPlayInfo(PlayInfo);
  PlayInfo.AddSetting("Game", "ArenaWeaponClassName", "Weapon Arena", 0, 120, "Select", StaticGetWeaponList());
}

defaultproperties
{
  FriendlyName="ConfigArena"
}