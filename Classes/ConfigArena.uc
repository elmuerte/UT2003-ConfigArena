///////////////////////////////////////////////////////////////////////////////
// filename:    ConfigArena.uc
// version:     100
// author:      Michiel 'El Muerte' Hendriks <elmuerte@drunksnipers.com>
// purpose:     A configurable Arena mutator
///////////////////////////////////////////////////////////////////////////////

class ConfigArena extends MutArena config;

function string getWeaponList()
{
  local string result;
  local string WeaponClass, WeaponDesc;
  local class<Weapon> Weapon;
  local int i;

  i = 0;
  GetNextIntDesc("Engine.Weapon",i,WeaponClass,WeaponDesc);
  while (WeaponClass != "")
	{
    weapon = class<weapon>(DynamicLoadObject(WeaponClass,Class'Class',true));
    if (weapon != none)
    {
      result = result$WeaponClass$";"$weapon.default.ItemName$";";
    }
    GetNextIntDesc("Engine.Weapon",++i,WeaponClass,WeaponDesc);
  }
  return result;
}

function MutatorFillPlayInfo(PlayInfo PlayInfo)
{
  FillPlayInfo(PlayInfo);
	PlayInfo.AddSetting("Game", "ArenaWeaponClassName", "Weapon Arena", 0, 120, "Select", getWeaponList());
  if (NextMutator != None) NextMutator.MutatorFillPlayInfo(PlayInfo);
}

defaultproperties
{
     FriendlyName="ConfigArena"
}