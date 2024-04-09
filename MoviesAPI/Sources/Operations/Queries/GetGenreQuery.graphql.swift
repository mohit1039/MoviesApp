// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetGenreQuery: GraphQLQuery {
  public static let operationName: String = "GetGenre"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetGenre { genres { __typename name } }"#
    ))

  public init() {}

  public struct Data: MoviesAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { MoviesAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("genres", [Genre?]?.self),
    ] }

    public var genres: [Genre?]? { __data["genres"] }

    /// Genre
    ///
    /// Parent Type: `Genre`
    public struct Genre: MoviesAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { MoviesAPI.Objects.Genre }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("name", String.self),
      ] }

      public var name: String { __data["name"] }
    }
  }
}
