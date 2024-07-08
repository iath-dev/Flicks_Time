import 'dart:convert';

class MovieCast {
  final int id;
  final List<Cast> cast;
  final List<Cast> crew;

  MovieCast({
    required this.id,
    required this.cast,
    required this.crew,
  });

  MovieCast copyWith({
    int? id,
    List<Cast>? cast,
    List<Cast>? crew,
  }) =>
      MovieCast(
        id: id ?? this.id,
        cast: cast ?? this.cast,
        crew: crew ?? this.crew,
      );

  factory MovieCast.fromJson(String str) => MovieCast.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MovieCast.fromMap(Map<String, dynamic> json) => MovieCast(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toMap())),
        "crew": List<dynamic>.from(crew.map((x) => x.toMap())),
      };
}

class Cast {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final int? castId;
  final String? character;
  final String? creditId;
  final int? order;
  final String? department;
  final String? job;

  Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
  });

  Cast copyWith({
    bool? adult,
    int? gender,
    int? id,
    String? knownForDepartment,
    String? name,
    String? originalName,
    double? popularity,
    String? profilePath,
    int? castId,
    String? character,
    String? creditId,
    int? order,
    String? department,
    String? job,
  }) =>
      Cast(
        adult: adult ?? this.adult,
        gender: gender ?? this.gender,
        id: id ?? this.id,
        knownForDepartment: knownForDepartment ?? this.knownForDepartment,
        name: name ?? this.name,
        originalName: originalName ?? this.originalName,
        popularity: popularity ?? this.popularity,
        profilePath: profilePath ?? this.profilePath,
        castId: castId ?? this.castId,
        character: character ?? this.character,
        creditId: creditId ?? this.creditId,
        order: order ?? this.order,
        department: department ?? this.department,
        job: job ?? this.job,
      );

  factory Cast.fromJson(String str) => Cast.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cast.fromMap(Map<String, dynamic> json) => Cast(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"],
        castId: json["cast_id"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
        department: json["department"],
        job: json["job"],
      );

  Map<String, dynamic> toMap() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath,
        "cast_id": castId,
        "character": character,
        "credit_id": creditId,
        "order": order,
        "department": department,
        "job": job,
      };
}

class MoviesImages {
  final List<MovieImage> backdrops;
  final int id;
  final List<MovieImage> logos;
  final List<MovieImage> posters;

  MoviesImages({
    required this.backdrops,
    required this.id,
    required this.logos,
    required this.posters,
  });

  MoviesImages copyWith({
    List<MovieImage>? backdrops,
    int? id,
    List<MovieImage>? logos,
    List<MovieImage>? posters,
  }) =>
      MoviesImages(
        backdrops: backdrops ?? this.backdrops,
        id: id ?? this.id,
        logos: logos ?? this.logos,
        posters: posters ?? this.posters,
      );

  factory MoviesImages.fromJson(String str) =>
      MoviesImages.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MoviesImages.fromMap(Map<String, dynamic> json) => MoviesImages(
        backdrops: List<MovieImage>.from(
            json["backdrops"].map((x) => MovieImage.fromMap(x))),
        id: json["id"],
        logos: List<MovieImage>.from(
            json["logos"].map((x) => MovieImage.fromMap(x))),
        posters: List<MovieImage>.from(
            json["posters"].map((x) => MovieImage.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "backdrops": List<dynamic>.from(backdrops.map((x) => x.toMap())),
        "id": id,
        "logos": List<dynamic>.from(logos.map((x) => x.toMap())),
        "posters": List<dynamic>.from(posters.map((x) => x.toMap())),
      };
}

class MovieImage {
  final double aspectRatio;
  final int height;
  final String? iso6391;
  final String filePath;
  final double voteAverage;
  final int voteCount;
  final int width;

  MovieImage({
    required this.aspectRatio,
    required this.height,
    required this.iso6391,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  MovieImage copyWith({
    double? aspectRatio,
    int? height,
    String? iso6391,
    String? filePath,
    double? voteAverage,
    int? voteCount,
    int? width,
  }) =>
      MovieImage(
        aspectRatio: aspectRatio ?? this.aspectRatio,
        height: height ?? this.height,
        iso6391: iso6391 ?? this.iso6391,
        filePath: filePath ?? this.filePath,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
        width: width ?? this.width,
      );

  factory MovieImage.fromJson(String str) =>
      MovieImage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MovieImage.fromMap(Map<String, dynamic> json) => MovieImage(
        aspectRatio: json["aspect_ratio"]?.toDouble(),
        height: json["height"],
        iso6391: json["iso_639_1"],
        filePath: json["file_path"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        width: json["width"],
      );

  Map<String, dynamic> toMap() => {
        "aspect_ratio": aspectRatio,
        "height": height,
        "iso_639_1": iso6391,
        "file_path": filePath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "width": width,
      };
}

class ApiResponse {
  final int page;
  final List<MovieResult> results;

  ApiResponse({
    required this.page,
    required this.results,
  });

  factory ApiResponse.fromJson(String str) =>
      ApiResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ApiResponse.fromMap(Map<String, dynamic> json) => ApiResponse(
        page: json["page"],
        results: List<MovieResult>.from(
            json["results"].map((x) => MovieResult.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}

class MoviesPlayingResponseModel extends ApiResponse {
  final Dates dates;

  MoviesPlayingResponseModel({
    required this.dates,
    required super.page,
    required super.results,
  });

  MoviesPlayingResponseModel copyWith({
    Dates? dates,
    int? page,
    List<MovieResult>? results,
  }) =>
      MoviesPlayingResponseModel(
        dates: dates ?? this.dates,
        page: page ?? this.page,
        results: results ?? this.results,
      );

  factory MoviesPlayingResponseModel.fromJson(String str) =>
      MoviesPlayingResponseModel.fromMap(json.decode(str));

  @override
  String toJson() => json.encode(toMap());

  factory MoviesPlayingResponseModel.fromMap(Map<String, dynamic> json) =>
      MoviesPlayingResponseModel(
        dates: Dates.fromMap(json["dates"]),
        page: json["page"],
        results: List<MovieResult>.from(
            json["results"].map((x) => MovieResult.fromMap(x))),
      );

  @override
  Map<String, dynamic> toMap() => {
        "dates": dates.toMap(),
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}

class MoviesPopularResponse extends ApiResponse {
  final int totalPages, totalResults;

  MoviesPopularResponse({
    required super.page,
    required super.results,
    required this.totalPages,
    required this.totalResults,
  });

  MoviesPopularResponse copyWith({
    int? page,
    List<MovieResult>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      MoviesPopularResponse(
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );

  factory MoviesPopularResponse.fromJson(String str) =>
      MoviesPopularResponse.fromMap(json.decode(str));

  @override
  String toJson() => json.encode(toMap());

  factory MoviesPopularResponse.fromMap(Map<String, dynamic> json) =>
      MoviesPopularResponse(
        page: json["page"],
        results: List<MovieResult>.from(
            json["results"].map((x) => MovieResult.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class MoviesUpcomingResponse extends ApiResponse {
  final Dates dates;
  final int totalPages, totalResults;

  MoviesUpcomingResponse({
    required this.dates,
    required super.page,
    required super.results,
    required this.totalPages,
    required this.totalResults,
  });

  MoviesUpcomingResponse copyWith({
    Dates? dates,
    int? page,
    List<MovieResult>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      MoviesUpcomingResponse(
        dates: dates ?? this.dates,
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );

  factory MoviesUpcomingResponse.fromJson(String str) =>
      MoviesUpcomingResponse.fromMap(json.decode(str));

  @override
  String toJson() => json.encode(toMap());

  factory MoviesUpcomingResponse.fromMap(Map<String, dynamic> json) =>
      MoviesUpcomingResponse(
        dates: Dates.fromMap(json["dates"]),
        page: json["page"],
        results: List<MovieResult>.from(
            json["results"].map((x) => MovieResult.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "dates": dates.toMap(),
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class MoviesTopRatedResponse extends ApiResponse {
  MoviesTopRatedResponse({
    required super.page,
    required super.results,
  });

  MoviesTopRatedResponse copyWith({
    int? page,
    List<MovieResult>? results,
  }) =>
      MoviesTopRatedResponse(
        page: page ?? this.page,
        results: results ?? this.results,
      );

  factory MoviesTopRatedResponse.fromJson(String str) =>
      MoviesTopRatedResponse.fromMap(json.decode(str));

  factory MoviesTopRatedResponse.fromMap(Map<String, dynamic> json) =>
      MoviesTopRatedResponse(
        page: json["page"],
        results: List<MovieResult>.from(
            json["results"].map((x) => MovieResult.fromMap(x))),
      );
}

class Dates {
  final DateTime maximum, minimum;

  Dates({
    required this.maximum,
    required this.minimum,
  });

  Dates copyWith({
    DateTime? maximum,
    DateTime? minimum,
  }) =>
      Dates(
        maximum: maximum ?? this.maximum,
        minimum: minimum ?? this.minimum,
      );

  factory Dates.fromJson(String str) => Dates.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Dates.fromMap(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
      );

  Map<String, dynamic> toMap() => {
        "maximum":
            "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum":
            "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
      };
}

class MovieBase {
  final bool adult;
  final String originalLanguage, originalTitle, overview;
  final int id;
  final double popularity;
  final String? title, backdropPath, posterPath;
  final DateTime? releaseDate;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  MovieBase({
    required this.adult,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    this.backdropPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  MovieBase copyWith({
    bool? adult,
    String? backdropPath,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    DateTime? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) =>
      MovieBase(
        adult: adult ?? this.adult,
        backdropPath: backdropPath ?? this.backdropPath,
        id: id ?? this.id,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalTitle: originalTitle ?? this.originalTitle,
        overview: overview ?? this.overview,
        popularity: popularity ?? this.popularity,
        posterPath: posterPath ?? this.posterPath,
        releaseDate: releaseDate ?? this.releaseDate,
        title: title ?? this.title,
        video: video ?? this.video,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );

  factory MovieBase.fromJson(String str) => MovieBase.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MovieBase.fromMap(Map<String, dynamic> json) => MovieBase(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.tryParse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toMap() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieBase && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class MovieResult extends MovieBase {
  final List<int> genreIds;

  MovieResult({
    required super.adult,
    required super.id,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required this.genreIds,
    super.backdropPath,
    super.releaseDate,
    super.title,
    super.video,
    super.voteAverage,
    super.voteCount,
  });

  @override
  MovieResult copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    DateTime? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) =>
      MovieResult(
        adult: adult ?? this.adult,
        backdropPath: backdropPath ?? this.backdropPath,
        genreIds: genreIds ?? this.genreIds,
        id: id ?? this.id,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalTitle: originalTitle ?? this.originalTitle,
        overview: overview ?? this.overview,
        popularity: popularity ?? this.popularity,
        posterPath: posterPath ?? this.posterPath,
        releaseDate: releaseDate ?? this.releaseDate,
        title: title ?? this.title,
        video: video ?? this.video,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );

  factory MovieResult.fromJson(String str) =>
      MovieResult.fromMap(json.decode(str));

  factory MovieResult.fromMap(Map<String, dynamic> json) => MovieResult(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.tryParse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

class MovieDetailsResponse extends MovieBase {
  final dynamic belongsToCollection;
  final int budget, revenue, runtime;
  final List<Genre> genres;
  final String homepage, status, tagline;
  final String? imdbId;
  final List<String> originCountry;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final List<SpokenLanguage> spokenLanguages;

  MovieDetailsResponse({
    required super.adult,
    required super.backdropPath,
    required super.id,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.releaseDate,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    this.imdbId,
    required this.originCountry,
    required this.productionCompanies,
    required this.productionCountries,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
  });

  @override
  MovieDetailsResponse copyWith({
    bool? adult,
    String? backdropPath,
    dynamic belongsToCollection,
    int? budget,
    List<Genre>? genres,
    String? homepage,
    int? id,
    String? imdbId,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    List<ProductionCompany>? productionCompanies,
    List<ProductionCountry>? productionCountries,
    DateTime? releaseDate,
    int? revenue,
    int? runtime,
    List<SpokenLanguage>? spokenLanguages,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) =>
      MovieDetailsResponse(
        adult: adult ?? this.adult,
        backdropPath: backdropPath ?? this.backdropPath,
        belongsToCollection: belongsToCollection ?? this.belongsToCollection,
        budget: budget ?? this.budget,
        genres: genres ?? this.genres,
        homepage: homepage ?? this.homepage,
        id: id ?? this.id,
        imdbId: imdbId ?? this.imdbId,
        originCountry: originCountry ?? this.originCountry,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalTitle: originalTitle ?? this.originalTitle,
        overview: overview ?? this.overview,
        popularity: popularity ?? this.popularity,
        posterPath: posterPath ?? this.posterPath,
        productionCompanies: productionCompanies ?? this.productionCompanies,
        productionCountries: productionCountries ?? this.productionCountries,
        releaseDate: releaseDate ?? this.releaseDate,
        revenue: revenue ?? this.revenue,
        runtime: runtime ?? this.runtime,
        spokenLanguages: spokenLanguages ?? this.spokenLanguages,
        status: status ?? this.status,
        tagline: tagline ?? this.tagline,
        title: title ?? this.title,
        video: video ?? this.video,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );

  factory MovieDetailsResponse.fromJson(String str) =>
      MovieDetailsResponse.fromMap(json.decode(str));

  @override
  String toJson() => json.encode(toMap());

  factory MovieDetailsResponse.fromMap(Map<String, dynamic> json) =>
      MovieDetailsResponse(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        belongsToCollection: json["belongs_to_collection"],
        budget: json["budget"],
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromMap(x))),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: List<ProductionCompany>.from(
            json["production_companies"]
                .map((x) => ProductionCompany.fromMap(x))),
        productionCountries: List<ProductionCountry>.from(
            json["production_countries"]
                .map((x) => ProductionCountry.fromMap(x))),
        releaseDate: DateTime.parse(json["release_date"]),
        revenue: json["revenue"],
        runtime: json["runtime"],
        spokenLanguages: List<SpokenLanguage>.from(
            json["spoken_languages"].map((x) => SpokenLanguage.fromMap(x))),
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "belongs_to_collection": belongsToCollection,
        "budget": budget,
        "genres": List<dynamic>.from(genres.map((x) => x.toMap())),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies":
            List<dynamic>.from(productionCompanies.map((x) => x.toMap())),
        "production_countries":
            List<dynamic>.from(productionCountries.map((x) => x.toMap())),
        "release_date":
            "${releaseDate?.year.toString().padLeft(4, '0')}-${releaseDate?.month.toString().padLeft(2, '0')}-${releaseDate?.day.toString().padLeft(2, '0')}",
        "revenue": revenue,
        "runtime": runtime,
        "spoken_languages":
            List<dynamic>.from(spokenLanguages.map((x) => x.toMap())),
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

class Genre {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  Genre copyWith({
    int? id,
    String? name,
  }) =>
      Genre(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Genre.fromJson(String str) => Genre.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Genre.fromMap(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}

class ProductionCompany {
  final int id;
  final String? logoPath;
  final String name, originCountry;

  ProductionCompany({
    required this.id,
    required this.name,
    required this.originCountry,
    this.logoPath,
  });

  ProductionCompany copyWith({
    int? id,
    String? logoPath,
    String? name,
    String? originCountry,
  }) =>
      ProductionCompany(
        id: id ?? this.id,
        logoPath: logoPath ?? this.logoPath,
        name: name ?? this.name,
        originCountry: originCountry ?? this.originCountry,
      );

  factory ProductionCompany.fromJson(String str) =>
      ProductionCompany.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductionCompany.fromMap(Map<String, dynamic> json) =>
      ProductionCompany(
        id: json["id"],
        logoPath: json["logo_path"],
        name: json["name"],
        originCountry: json["origin_country"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
      };
}

class ProductionCountry {
  final String iso31661, name;

  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  ProductionCountry copyWith({
    String? iso31661,
    String? name,
  }) =>
      ProductionCountry(
        iso31661: iso31661 ?? this.iso31661,
        name: name ?? this.name,
      );

  factory ProductionCountry.fromJson(String str) =>
      ProductionCountry.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductionCountry.fromMap(Map<String, dynamic> json) =>
      ProductionCountry(
        iso31661: json["iso_3166_1"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "iso_3166_1": iso31661,
        "name": name,
      };
}

class SpokenLanguage {
  final String englishName, iso6391, name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  SpokenLanguage copyWith({
    String? englishName,
    String? iso6391,
    String? name,
  }) =>
      SpokenLanguage(
        englishName: englishName ?? this.englishName,
        iso6391: iso6391 ?? this.iso6391,
        name: name ?? this.name,
      );

  factory SpokenLanguage.fromJson(String str) =>
      SpokenLanguage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SpokenLanguage.fromMap(Map<String, dynamic> json) => SpokenLanguage(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
      };
}
