//
//  MathUtils.swift
//  chapter07
//
//  Created by Marius on 3/1/16.
//  Copyright © 2016 Marius Horga. All rights reserved.
//

import simd

struct Vertex {
    var position: vector_float4
    var color: vector_float4
}

struct Matrix {
    var m: [Float]
    
    init() {
        m = [1, 0, 0, 0,
            0, 1, 0, 0,
            0, 0, 1, 0,
            0, 0, 0, 1
        ]
    }
    
    func translationMatrix(var matrix: Matrix, _ position: float3) -> Matrix {
        matrix.m[12] = position.x
        matrix.m[13] = position.y
        matrix.m[14] = position.z
        return matrix
    }
    
    func scalingMatrix(var matrix: Matrix, _ scale: Float) -> Matrix {
        matrix.m[0] = scale
        matrix.m[5] = scale
        matrix.m[10] = scale
        matrix.m[15] = 1.0
        return matrix
    }
    
    func rotationMatrix(var matrix: Matrix, _ rot: float3) -> Matrix {
        matrix.m[0] = cos(rot.y) * cos(rot.z)
        matrix.m[4] = cos(rot.z) * sin(rot.x) * sin(rot.y) - cos(rot.x) * sin(rot.z)
        matrix.m[8] = cos(rot.x) * cos(rot.z) * sin(rot.y) + sin(rot.x) * sin(rot.z)
        matrix.m[1] = cos(rot.y) * sin(rot.z)
        matrix.m[5] = cos(rot.x) * cos(rot.z) + sin(rot.x) * sin(rot.y) * sin(rot.z)
        matrix.m[9] = -cos(rot.z) * sin(rot.x) + cos(rot.x) * sin(rot.y) * sin(rot.z)
        matrix.m[2] = -sin(rot.y)
        matrix.m[6] = cos(rot.y) * sin(rot.x)
        matrix.m[10] = cos(rot.x) * cos(rot.y)
        matrix.m[15] = 1.0
        return matrix
    }
    
    func modelMatrix(var matrix: Matrix) -> Matrix {
        matrix = rotationMatrix(matrix, float3(0.0, 0.0, 0.1))
        matrix = scalingMatrix(matrix, 0.25)
        matrix = translationMatrix(matrix, float3(0.0, 0.5, 0.0))
        return matrix
    }
}
