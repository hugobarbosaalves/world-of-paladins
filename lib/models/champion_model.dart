class Champion {
  String? ability1;
  String? ability2;
  String? ability3;
  String? ability4;
  String? ability5;
  int? abilityId1;
  int? abilityId2;
  int? abilityId3;
  int? abilityId4;
  int? abilityId5;
  Ability1? ability_1;
  Ability1? ability_2;
  Ability1? ability_3;
  Ability1? ability_4;
  Ability1? ability_5;
  String? championAbility1URL;
  String? championAbility2URL;
  String? championAbility3URL;
  String? championAbility4URL;
  String? championAbility5URL;
  String? championCardURL;
  String? championIconURL;
  String? cons;
  int? health;
  String? lore;
  String? name;
  String? nameEnglish;
  String? onFreeRotation;
  String? onFreeWeeklyRotation;
  String? pantheon;
  String? pros;
  String? roles;
  int? speed;
  String? title;
  String? type;
  String? abilityDescription1;
  String? abilityDescription2;
  String? abilityDescription3;
  String? abilityDescription4;
  String? abilityDescription5;
  int? id;
  String? latestChampion;
  Null retMsg;

  Champion(
      {this.ability1,
      this.ability2,
      this.ability3,
      this.ability4,
      this.ability5,
      this.abilityId1,
      this.abilityId2,
      this.abilityId3,
      this.abilityId4,
      this.abilityId5,
      this.ability_1,
      this.ability_2,
      this.ability_3,
      this.ability_4,
      this.ability_5,
      this.championAbility1URL,
      this.championAbility2URL,
      this.championAbility3URL,
      this.championAbility4URL,
      this.championAbility5URL,
      this.championCardURL,
      this.championIconURL,
      this.cons,
      this.health,
      this.lore,
      this.name,
      this.nameEnglish,
      this.onFreeRotation,
      this.onFreeWeeklyRotation,
      this.pantheon,
      this.pros,
      this.roles,
      this.speed,
      this.title,
      this.type,
      this.abilityDescription1,
      this.abilityDescription2,
      this.abilityDescription3,
      this.abilityDescription4,
      this.abilityDescription5,
      this.id,
      this.latestChampion,
      this.retMsg});

  Champion.fromJson(Map<String, dynamic> json) {
    ability1 = json['Ability1'];
    ability2 = json['Ability2'];
    ability3 = json['Ability3'];
    ability4 = json['Ability4'];
    ability5 = json['Ability5'];
    abilityId1 = json['AbilityId1'];

    abilityId2 = json['AbilityId2'];
    abilityId3 = json['AbilityId3'];
    abilityId4 = json['AbilityId4'];
    abilityId5 = json['AbilityId5'];

    ability_1 = json['Ability_1'] != null ? Ability1.fromJson(json['Ability_1']) : null;
    ability_2 = json['Ability_2'] != null ? Ability1.fromJson(json['Ability_2']) : null;
    ability_3 = json['Ability_3'] != null ? Ability1.fromJson(json['Ability_3']) : null;
    ability_4 = json['Ability_4'] != null ? Ability1.fromJson(json['Ability_4']) : null;
    ability_5 = json['Ability_5'] != null ? Ability1.fromJson(json['Ability_5']) : null;

    championAbility1URL = json['ChampionAbility1_URL'];
    championAbility2URL = json['ChampionAbility2_URL'];
    championAbility3URL = json['ChampionAbility3_URL'];
    championAbility4URL = json['ChampionAbility4_URL'];
    championAbility5URL = json['ChampionAbility5_URL'];
    championCardURL = json['ChampionCard_URL'];
    championIconURL = json['ChampionIcon_URL'];
    cons = json['Cons'];
    health = json['Health'];
    lore = json['Lore'];
    name = json['Name'];
    nameEnglish = json['Name_English'];
    onFreeRotation = json['OnFreeRotation'];
    onFreeWeeklyRotation = json['OnFreeWeeklyRotation'];
    pantheon = json['Pantheon'];
    pros = json['Pros'];
    roles = json['Roles'];
    speed = json['Speed'];
    title = json['Title'];
    type = json['Type'];
    abilityDescription1 = json['abilityDescription1'];
    abilityDescription2 = json['abilityDescription2'];
    abilityDescription3 = json['abilityDescription3'];
    abilityDescription4 = json['abilityDescription4'];
    abilityDescription5 = json['abilityDescription5'];
    id = json['id'];
    latestChampion = json['latestChampion'];
    retMsg = json['ret_msg'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Ability1'] = this.ability1;
    data['Ability2'] = this.ability2;
    data['Ability3'] = this.ability3;
    data['Ability4'] = this.ability4;
    data['Ability5'] = this.ability5;
    data['AbilityId1'] = abilityId1;
    data['AbilityId2'] = abilityId2;
    data['AbilityId3'] = abilityId3;
    data['AbilityId4'] = abilityId4;
    data['AbilityId5'] = abilityId5;

    data['Ability_1'] = ability_1?.toJson();

    data['Ability_2'] = this.ability_2?.toJson();

    data['Ability_3'] = this.ability_3?.toJson();

    data['Ability_4'] = this.ability_4?.toJson();

    data['Ability_5'] = this.ability_5?.toJson();

    data['ChampionAbility1_URL'] = this.championAbility1URL;
    data['ChampionAbility2_URL'] = this.championAbility2URL;
    data['ChampionAbility3_URL'] = this.championAbility3URL;
    data['ChampionAbility4_URL'] = this.championAbility4URL;
    data['ChampionAbility5_URL'] = this.championAbility5URL;
    data['ChampionCard_URL'] = this.championCardURL;
    data['ChampionIcon_URL'] = this.championIconURL;
    data['Cons'] = this.cons;
    data['Health'] = this.health;
    data['Lore'] = this.lore;
    data['Name'] = this.name;
    data['Name_English'] = this.nameEnglish;
    data['OnFreeRotation'] = this.onFreeRotation;
    data['OnFreeWeeklyRotation'] = this.onFreeWeeklyRotation;
    data['Pantheon'] = this.pantheon;
    data['Pros'] = this.pros;
    data['Roles'] = this.roles;
    data['Speed'] = this.speed;
    data['Title'] = this.title;
    data['Type'] = this.type;
    data['abilityDescription1'] = this.abilityDescription1;
    data['abilityDescription2'] = this.abilityDescription2;
    data['abilityDescription3'] = this.abilityDescription3;
    data['abilityDescription4'] = this.abilityDescription4;
    data['abilityDescription5'] = this.abilityDescription5;
    data['id'] = this.id;
    data['latestChampion'] = this.latestChampion;
    data['ret_msg'] = this.retMsg;
    return data;
  }
}

class Ability1 {
  late String description;
  late int id;
  late String summary;
  late String uRL;
  late String damageType;
  late int rechargeSeconds;

  Ability1({
    required this.description,
    required this.id,
    required this.summary,
    required this.uRL,
    required this.damageType,
    required this.rechargeSeconds,
  });

  Ability1.fromJson(Map<String, dynamic> json) {
    description = json['Description'];
    id = json['Id'];
    summary = json['Summary'];
    uRL = json['URL'];
    damageType = json['damageType'];
    rechargeSeconds = json['rechargeSeconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Description'] = this.description;
    data['Id'] = this.id;
    data['Summary'] = this.summary;
    data['URL'] = this.uRL;
    data['damageType'] = this.damageType;
    data['rechargeSeconds'] = this.rechargeSeconds;
    return data;
  }
}
