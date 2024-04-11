class CommentsResponse {
  Data? data;
  Null? paginationToken;

  CommentsResponse({this.data, this.paginationToken});

  CommentsResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    paginationToken = json['pagination_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['pagination_token'] = this.paginationToken;
    return data;
  }
}

class Data {
  AdditionalData? additionalData;
  int? count;
  List<Items>? items;
  int? total;

  Data({this.additionalData, this.count, this.items, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    additionalData = json['additional_data'] != null
        ? new AdditionalData.fromJson(json['additional_data'])
        : null;
    count = json['count'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.additionalData != null) {
      data['additional_data'] = this.additionalData!.toJson();
    }
    data['count'] = this.count;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    return data;
  }
}

class AdditionalData {
  Caption? caption;
  bool? captionIsEdited;
  String? commentFilterParam;
  bool? commentLikesEnabled;
  String? mediaHeaderDisplay;
  List<QuickResponseEmojis>? quickResponseEmojis;

  AdditionalData(
      {this.caption,
      this.captionIsEdited,
      this.commentFilterParam,
      this.commentLikesEnabled,
      this.mediaHeaderDisplay,
      this.quickResponseEmojis});

  AdditionalData.fromJson(Map<String, dynamic> json) {
    caption =
        json['caption'] != null ? new Caption.fromJson(json['caption']) : null;
    captionIsEdited = json['caption_is_edited'];
    commentFilterParam = json['comment_filter_param'];
    commentLikesEnabled = json['comment_likes_enabled'];
    mediaHeaderDisplay = json['media_header_display'];
    if (json['quick_response_emojis'] != null) {
      quickResponseEmojis = <QuickResponseEmojis>[];
      json['quick_response_emojis'].forEach((v) {
        quickResponseEmojis!.add(new QuickResponseEmojis.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.caption != null) {
      data['caption'] = this.caption!.toJson();
    }
    data['caption_is_edited'] = this.captionIsEdited;
    data['comment_filter_param'] = this.commentFilterParam;
    data['comment_likes_enabled'] = this.commentLikesEnabled;
    data['media_header_display'] = this.mediaHeaderDisplay;
    if (this.quickResponseEmojis != null) {
      data['quick_response_emojis'] =
          this.quickResponseEmojis!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Caption {
  String? contentType;
  int? createdAt;
  int? createdAtUtc;
  bool? didReportAsSpam;
  bool? hasTranslation;
  List<String>? hashtags;
  String? id;
  bool? isCovered;
  bool? isCreatedByMediaOwner;
  bool? isRankedComment;
  List<Null>? mentions;
  int? privateReplyStatus;
  bool? shareEnabled;
  String? text;
  int? type;
  User? user;
  String? userId;

  Caption(
      {this.contentType,
      this.createdAt,
      this.createdAtUtc,
      this.didReportAsSpam,
      this.hasTranslation,
      this.hashtags,
      this.id,
      this.isCovered,
      this.isCreatedByMediaOwner,
      this.isRankedComment,
      this.mentions,
      this.privateReplyStatus,
      this.shareEnabled,
      this.text,
      this.type,
      this.user,
      this.userId});

  Caption.fromJson(Map<String, dynamic> json) {
    contentType = json['content_type'];
    createdAt = json['created_at'];
    createdAtUtc = json['created_at_utc'];
    didReportAsSpam = json['did_report_as_spam'];
    hasTranslation = json['has_translation'];
    hashtags = json['hashtags'].cast<String>();
    id = json['id'];
    isCovered = json['is_covered'];
    isCreatedByMediaOwner = json['is_created_by_media_owner'];
    isRankedComment = json['is_ranked_comment'];
    // if (json['mentions'] != null) {
    //   mentions = <Null>[];
    //   json['mentions'].forEach((v) {
    //     mentions!.add(new Null.fromJson(v));
    //   });
    // }
    privateReplyStatus = json['private_reply_status'];
    shareEnabled = json['share_enabled'];
    text = json['text'];
    type = json['type'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content_type'] = this.contentType;
    data['created_at'] = this.createdAt;
    data['created_at_utc'] = this.createdAtUtc;
    data['did_report_as_spam'] = this.didReportAsSpam;
    data['has_translation'] = this.hasTranslation;
    data['hashtags'] = this.hashtags;
    data['id'] = this.id;
    data['is_covered'] = this.isCovered;
    data['is_created_by_media_owner'] = this.isCreatedByMediaOwner;
    data['is_ranked_comment'] = this.isRankedComment;
    // if (this.mentions != null) {
    //   data['mentions'] = this.mentions!.map((v) => v.toJson()).toList();
    // }
    data['private_reply_status'] = this.privateReplyStatus;
    data['share_enabled'] = this.shareEnabled;
    data['text'] = this.text;
    data['type'] = this.type;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['user_id'] = this.userId;
    return data;
  }
}

class User {
  int? fbidV2;
  String? fullName;
  String? id;
  bool? isPrivate;
  bool? isVerified;
  String? profilePicId;
  String? profilePicUrl;
  String? username;

  User(
      {this.fbidV2,
      this.fullName,
      this.id,
      this.isPrivate,
      this.isVerified,
      this.profilePicId,
      this.profilePicUrl,
      this.username});

  User.fromJson(Map<String, dynamic> json) {
    fbidV2 = json['fbid_v2'];
    fullName = json['full_name'];
    id = json['id'];
    isPrivate = json['is_private'];
    isVerified = json['is_verified'];
    profilePicId = json['profile_pic_id'];
    profilePicUrl = json['profile_pic_url'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fbid_v2'] = this.fbidV2;
    data['full_name'] = this.fullName;
    data['id'] = this.id;
    data['is_private'] = this.isPrivate;
    data['is_verified'] = this.isVerified;
    data['profile_pic_id'] = this.profilePicId;
    data['profile_pic_url'] = this.profilePicUrl;
    data['username'] = this.username;
    return data;
  }
}

class QuickResponseEmojis {
  String? unicode;

  QuickResponseEmojis({this.unicode});

  QuickResponseEmojis.fromJson(Map<String, dynamic> json) {
    unicode = json['unicode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unicode'] = this.unicode;
    return data;
  }
}

class Items {
  int? commentLikeCount;
  String? contentType;
  int? createdAt;
  int? createdAtUtc;
  bool? didReportAsSpam;
  bool? hasLiked;
  bool? hasLikedComment;
  bool? hasTranslation;
  List<Null>? hashtags;
  String? id;
  String? inlineComposerDisplayCondition;
  bool? isCovered;
  bool? isRankedComment;
  int? likeCount;
  List<Null>? mentions;
  List<Null>? otherPreviewUsers;
  int? privateReplyStatus;
  bool? shareEnabled;
  String? text;
  int? type;
  CommentUser? user;
  String? userId;

  Items(
      {this.commentLikeCount,
      this.contentType,
      this.createdAt,
      this.createdAtUtc,
      this.didReportAsSpam,
      this.hasLiked,
      this.hasLikedComment,
      this.hasTranslation,
      this.hashtags,
      this.id,
      this.inlineComposerDisplayCondition,
      this.isCovered,
      this.isRankedComment,
      this.likeCount,
      this.mentions,
      this.otherPreviewUsers,
      this.privateReplyStatus,
      this.shareEnabled,
      this.text,
      this.type,
      this.user,
      this.userId});

  Items.fromJson(Map<String, dynamic> json) {
    commentLikeCount = json['comment_like_count'];
    contentType = json['content_type'];
    createdAt = json['created_at'];
    createdAtUtc = json['created_at_utc'];
    didReportAsSpam = json['did_report_as_spam'];
    hasLiked = json['has_liked'];
    hasLikedComment = json['has_liked_comment'];
    hasTranslation = json['has_translation'];
    // if (json['hashtags'] != null) {
    //   hashtags = <Null>[];
    //   json['hashtags'].forEach((v) {
    //     hashtags!.add(new Null.fromJson(v));
    //   });
    // }
    id = json['id'];
    inlineComposerDisplayCondition = json['inline_composer_display_condition'];
    isCovered = json['is_covered'];
    isRankedComment = json['is_ranked_comment'];
    likeCount = json['like_count'];
    // if (json['mentions'] != null) {
    //   mentions = <Null>[];
    //   json['mentions'].forEach((v) {
    //     mentions!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['other_preview_users'] != null) {
    //   otherPreviewUsers = <Null>[];
    //   json['other_preview_users'].forEach((v) {
    //     otherPreviewUsers!.add(new Null.fromJson(v));
    //   });
    // }
    privateReplyStatus = json['private_reply_status'];
    shareEnabled = json['share_enabled'];
    text = json['text'];
    type = json['type'];
    user = json['user'] != null ? new CommentUser.fromJson(json['user']) : null;
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment_like_count'] = this.commentLikeCount;
    data['content_type'] = this.contentType;
    data['created_at'] = this.createdAt;
    data['created_at_utc'] = this.createdAtUtc;
    data['did_report_as_spam'] = this.didReportAsSpam;
    data['has_liked'] = this.hasLiked;
    data['has_liked_comment'] = this.hasLikedComment;
    data['has_translation'] = this.hasTranslation;
    // if (this.hashtags != null) {
    //   data['hashtags'] = this.hashtags!.map((v) => v.toJson()).toList();
    // }
    data['id'] = this.id;
    data['inline_composer_display_condition'] =
        this.inlineComposerDisplayCondition;
    data['is_covered'] = this.isCovered;
    data['is_ranked_comment'] = this.isRankedComment;
    data['like_count'] = this.likeCount;
    // if (this.mentions != null) {
    //   data['mentions'] = this.mentions!.map((v) => v.toJson()).toList();
    // }
    // if (this.otherPreviewUsers != null) {
    //   data['other_preview_users'] =
    //       this.otherPreviewUsers!.map((v) => v.toJson()).toList();
    // }
    data['private_reply_status'] = this.privateReplyStatus;
    data['share_enabled'] = this.shareEnabled;
    data['text'] = this.text;
    data['type'] = this.type;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['user_id'] = this.userId;
    return data;
  }
}

class CommentUser {
  int? fbidV2;
  String? fullName;
  String? id;
  bool? isMentionable;
  bool? isPrivate;
  bool? isVerified;
  int? latestBestiesReelMedia;
  int? latestReelMedia;
  String? profilePicId;
  String? profilePicUrl;
  String? username;

  CommentUser(
      {this.fbidV2,
      this.fullName,
      this.id,
      this.isMentionable,
      this.isPrivate,
      this.isVerified,
      this.latestBestiesReelMedia,
      this.latestReelMedia,
      this.profilePicId,
      this.profilePicUrl,
      this.username});

  CommentUser.fromJson(Map<String, dynamic> json) {
    fbidV2 = json['fbid_v2'];
    fullName = json['full_name'];
    id = json['id'];
    isMentionable = json['is_mentionable'];
    isPrivate = json['is_private'];
    isVerified = json['is_verified'];
    latestBestiesReelMedia = json['latest_besties_reel_media'];
    latestReelMedia = json['latest_reel_media'];
    profilePicId = json['profile_pic_id'];
    profilePicUrl = json['profile_pic_url'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fbid_v2'] = this.fbidV2;
    data['full_name'] = this.fullName;
    data['id'] = this.id;
    data['is_mentionable'] = this.isMentionable;
    data['is_private'] = this.isPrivate;
    data['is_verified'] = this.isVerified;
    data['latest_besties_reel_media'] = this.latestBestiesReelMedia;
    data['latest_reel_media'] = this.latestReelMedia;
    data['profile_pic_id'] = this.profilePicId;
    data['profile_pic_url'] = this.profilePicUrl;
    data['username'] = this.username;
    return data;
  }
}
