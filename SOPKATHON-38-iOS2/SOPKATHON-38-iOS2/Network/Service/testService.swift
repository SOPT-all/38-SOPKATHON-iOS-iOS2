//
//  testService.swift
//  SOPKATHON-38-iOS2
//
//  Created by 이상엽 on 5/16/26.
//

import Foundation

protocol TestService {
    func getTest(id: Int) async throws -> EmptyResponseDTO
    func getParameterExample() async throws -> EmptyResponseDTO
}

final class DefaultTestService: TestService {
    let network = NetworkService.shared
    
    func getTest(id: Int) async throws -> EmptyResponseDTO {
        do {
            let response: EmptyResponseDTO = try await network.request(endPoint: .test(id))
            return response
        } catch {
            print("\(error.localizedDescription)")
            return EmptyResponseDTO()
        }
    }
    
    func getParameterExample() async throws -> EmptyResponseDTO {
        do {
            let response: EmptyResponseDTO = try await network.request(endPoint: .parameterExample)
            return response
        } catch {
            print("\(error.localizedDescription)")
            return EmptyResponseDTO()
        }
    }
}

final class MockTestService: TestService {
    func getTest(id: Int) async throws -> EmptyResponseDTO {
        return EmptyResponseDTO()
    }
    
    func getParameterExample() async throws -> EmptyResponseDTO {
        return EmptyResponseDTO()
    }
}
