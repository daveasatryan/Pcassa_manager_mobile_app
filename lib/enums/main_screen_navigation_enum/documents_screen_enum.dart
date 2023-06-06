enum DocumentsScreenType { createDocument, documentList }

extension DocumentsScreenTypeTranslation on DocumentsScreenType {
  String get title {
    switch (this) {
      case DocumentsScreenType.createDocument:
        return 'DocumentsScreenType.createDocument';
      case DocumentsScreenType.documentList:
        return 'DocumentsScreenType.documentList';
    }
  }
}
