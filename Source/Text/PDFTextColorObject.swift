//
//  PDFTextColorObject.swift
//  TPPDF
//
//  Created by Philip Niedertscheider on 12/08/2017.
//

/**
 Changes the text color in the container, where this object is in.
 */
class PDFTextColorObject: PDFObject {

    /**
     New text color in container after calculation
     */
    var color: UIColor

    /**
     Initalizer

     - parameter textColor: New text color
     */
    init(color: UIColor) {
        self.color = color
    }

    /**
     Sets the text color in `container`

     - parameter generator: Generator which holds font information
     - parameter container: Container, where the font is changed

     - throws: None

     - returns: Self
     */
    override func calculate(generator: PDFGenerator, container: PDFContainer) throws -> [(PDFContainer, PDFObject)] {
        generator.textColor[container] = color

        return [(container, self)]
    }

    /**
     Creates a new `PDFTextColorObject` with the same properties
     */
    override var copy: PDFObject {
        return PDFTextColorObject(color: self.color)
    }
}

extension PDFTextColorObject: CustomDebugStringConvertible {

    var debugDescription: String {
        return "PDFTextColorObject(color: \(color.hex))"
    }
}

extension PDFTextColorObject: CustomStringConvertible {

    var description: String {
        return "PDFTextColorObject(color: \(color.hex))"
    }
}
