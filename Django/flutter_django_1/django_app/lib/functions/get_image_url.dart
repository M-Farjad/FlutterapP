String getImageUrl(String type) {
  switch (type.toLowerCase()) {
    case 'fire':
      return 'assets/fire.png';
    case 'water':
      return 'assets/water.png';
    case 'grass':
      return 'assets/grass.png';
    case 'electric':
      return 'assets/electric.png';
    case 'ice':
      return 'assets/ice.png';
    case 'fighting':
      return 'assets/fighting.png';
    case 'poison':
      return 'assets/poison.png';
    case 'ground':
      return 'assets/ground.png';
    case 'flying':
      return 'assets/flying.png';
    case 'psychic':
      return 'assets/psychic.png';
    case 'bug':
      return 'assets/bug.png';
    case 'rock':
      return 'assets/rock.png';
    case 'ghost':
      return 'assets/ghost.png';
    case 'dark':
      return 'assets/dark.png';
    case 'dragon':
      return 'assets/dragon.png';
    case 'steel':
      return 'assets/steel.png';
    case 'fairy':
      return 'assets/fairy.png';
    default:
      return 'assets/normal.png';
  }
}
