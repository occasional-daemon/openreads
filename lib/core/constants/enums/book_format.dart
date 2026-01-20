enum BookFormat {
  paperback,
  hardcover,
  ebook,
  audiobook,
  webnovel,
}

extension BookFormatExtension on BookFormat {
  int get value {
    switch (this) {
      case BookFormat.paperback:
        return 0;
      case BookFormat.hardcover:
        return 1;
      case BookFormat.ebook:
        return 2;
      case BookFormat.audiobook:
        return 3;
      case BookFormat.webnovel:
        return 4;
      default:
        return 0;
    }
  }
}

BookFormat parseBookFormat(int value) {
  switch (value) {
    case 0:
      return BookFormat.paperback;
    case 1:
      return BookFormat.hardcover;
    case 2:
      return BookFormat.ebook;
    case 3:
      return BookFormat.audiobook;
    case 4:
      return BookFormat.webnovel;
    default:
      return BookFormat.paperback;
  }
}
