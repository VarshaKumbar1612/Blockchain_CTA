// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CertificateRegistry {
    address public issuer;

    struct Certificate {
        string studentName;
        string courseName;
        uint256 issuedDate;
        bool isValid;
    }

    mapping(string => Certificate) private certificates;

    event CertificateIssued(
        string indexed certId,
        string studentName,
        string courseName,
        uint256 issuedDate
    );

    constructor() {
        issuer = msg.sender;
    }

    function issueCertificate(
        string memory _certId,
        string memory _studentName,
        string memory _courseName
    ) public {
        require(msg.sender == issuer, "Only authorized issuer can issue");
        require(bytes(_certId).length > 0, "Certificate ID required");
        require(!certificates[_certId].isValid, "Certificate ID already exists");

        certificates[_certId] = Certificate({
            studentName: _studentName,
            courseName: _courseName,
            issuedDate: block.timestamp,
            isValid: true
        });

        emit CertificateIssued(_certId, _studentName, _courseName, block.timestamp);
    }

    function verifyCertificate(string memory _certId)
        public
        view
        returns (
            string memory studentName,
            string memory courseName,
            uint256 issuedDate,
            bool isValid
        )
    {
        Certificate memory cert = certificates[_certId];
        return (cert.studentName, cert.courseName, cert.issuedDate, cert.isValid);
    }
}