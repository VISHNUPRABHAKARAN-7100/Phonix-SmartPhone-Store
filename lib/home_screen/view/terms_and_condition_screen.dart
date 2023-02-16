import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constant_colors.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(),
        elevation: 0,
        backgroundColor: ConstantColors.appBackgroundColor,
        title: Text(
          'PHONIX',
          style: GoogleFonts.ubuntu(
              color: ConstantColors.constantBlackColor,
              fontSize: size.height * 0.035),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            const TiteleOfTermsAndConditon(title: 'Terms and Condition'),
            SizedBox(height: size.height * 0.02),
            const ContentOfTermsAndCondition(
              title: 'Welcome to PHONIX!',
            ),
            SizedBox(height: size.height * 0.02),
            const ContentOfTermsAndCondition(
              title: 'By using this app we assume you accept these '
                  'terms and conditions. Do not continue to use PHONIX '
                  'if you do not agree to take all of the terms and'
                  ' conditions stated on this page.',
            ),
            SizedBox(height: size.height * 0.02),
            const ContentOfTermsAndCondition(
              title: 'The following terminology applies to these'
                  ' Terms and Conditions, Privacy Statement and'
                  ' Disclaimer Notice and all Agreements: "Client",'
                  ' "You" and "Your" refers to you, the person log on'
                  ' this website and compliant to the Company’s terms'
                  ' and conditions. "The Company", "Ourselves", "We", '
                  '"Our" and "Us", refers to our Company. "Party", "Parties",'
                  ' or "Us", refers to both the Client and ourselves.'
                  ' All terms refer to the offer, acceptance and consideration'
                  ' of payment necessary to undertake the process of our'
                  ' assistance to the Client in the most appropriate manner'
                  ' for the express purpose of meeting the Client’s needs in'
                  ' respect of provision of the Company’s stated services,'
                  ' in accordance with and subject to, prevailing law of'
                  ' Netherlands. Any use of the above terminology or other'
                  ' words in the singular, plural, capitalization and/or'
                  ' he/she or they, are taken as interchangeable and'
                  ' therefore as referring to same. Our Terms and Conditions'
                  ' were created with the help of the App Terms and Conditions'
                  ' Generator from App-Privacy-Policy.com',
            ),
            SizedBox(height: size.height * 0.02),
            const TiteleOfTermsAndConditon(title: 'License'),
            SizedBox(height: size.height * 0.02),
            const ContentOfTermsAndCondition(
              title: 'Unless otherwise stated,'
                  ' PHONIX and/or its licensors own the intellectual property'
                  ' rights for all material on PHONIX. All intellectual property'
                  ' rights are reserved. You may access this from PHONIX for your'
                  ' own personal use subjected to restrictions set in these terms'
                  ' and conditions.',
            ),
            SizedBox(height: size.height * 0.02),
            const ContentOfTermsAndCondition(title: 'You must not:'),
            SizedBox(height: size.height * 0.02),
            const ContentOfTermsAndCondition(
              title: '▪️Republish material from PHONIX',
            ),
            const ContentOfTermsAndCondition(
              title: '▪️Sell, rent or sub-license material from PHONIX',
            ),
            const ContentOfTermsAndCondition(
              title: '▪️Reproduce, duplicate or copy material from PHONIX',
            ),
            const ContentOfTermsAndCondition(
              title: '▪️Redistribute content from PHONIX',
            ),
            SizedBox(height: size.height * 0.01),
            const ContentOfTermsAndCondition(
              title: 'You must not:',
            ),
            SizedBox(height: size.height * 0.01),
            const ContentOfTermsAndCondition(
              title: 'This Agreement shall begin on the date hereof.',
            ),
            const ContentOfTermsAndCondition(
              title: 'Parts of this app offer an opportunity '
                  'for users to post and exchange opinions and'
                  ' information in certain areas of the website.'
                  ' PHONIX does not filter, edit, publish or review'
                  ' Comments prior to their presence on the website.'
                  ' Comments do not reflect the views and opinions of'
                  ' PHONIX, its agents and/or affiliates. Comments'
                  ' reflect the views and opinions of the person who'
                  ' post their views and opinions. To the extent permitted '
                  'by applicable laws, PHONIX shall not be liable for'
                  ' the Comments or for any liability, damages or expenses'
                  ' caused and/or suffered as a result of any use of and/or'
                  ' posting of and/or appearance of the Comments on'
                  ' this website.',
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const ContentOfTermsAndCondition(
              title: 'PHONIX reserves the right to monitor all Comments'
                  ' and to remove any Comments which can be considered '
                  'inappropriate, offensive or causes breach of these'
                  ' Terms and Conditions.',
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const ContentOfTermsAndCondition(
              title: 'You warrant and represent that:',
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const ContentOfTermsAndCondition(
              title: '▪️You are entitled to post the Comments'
                  ' on our App and have all necessary '
                  'licenses and consents to do so;',
            ),
            const ContentOfTermsAndCondition(
              title: '▪️The Comments do not invade any intellectual'
                  ' property right, including without limitation'
                  ' copyright, patent or trademark of any third party;',
            ),
            const ContentOfTermsAndCondition(
              title: '▪️The Comments do not contain any defamatory,'
                  ' libelous, offensive, indecent or otherwise'
                  ' unlawful material which is an invasion of privacy',
            ),
            const ContentOfTermsAndCondition(
              title: '▪️The Comments will not be used to solicit'
                  ' or promote business or custom or present '
                  'commercial activities or unlawful activity.',
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const ContentOfTermsAndCondition(
              title: 'You hereby grant PHONIX a non-exclusive'
                  ' license to use, reproduce, edit and authorize'
                  ' others to use, reproduce and edit any of your'
                  ' Comments in any and all forms, formats or media.',
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const TiteleOfTermsAndConditon(
              title: 'Hyperlinking to our App',
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const ContentOfTermsAndCondition(
              title: 'The following organizations may'
                  ' link to our App without prior written approval:',
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const ContentOfTermsAndCondition(title: '▪️Government agencies;'),
            const ContentOfTermsAndCondition(title: '▪️Search engines;'),
            const ContentOfTermsAndCondition(title: '▪️News organizations;'),
            const ContentOfTermsAndCondition(
              title: '▪️Online directory distributors may link to our'
                  ' App in the same manner as they hyperlink to the'
                  ' Websites of other listed businesses; and',
            ),
            const ContentOfTermsAndCondition(
              title: '▪️System wide Accredited Businesses except soliciting'
                  ' non-profit organizations, charity shopping malls,'
                  ' and charity fundraising groups which may not'
                  ' hyperlink to our Web site.',
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const ContentOfTermsAndCondition(
              title: 'These organizations may link to our home page,'
                  ' to publications or to other App information so '
                  'long as the link: (a) is not in any way deceptive;'
                  ' (b) does not falsely imply sponsorship, endorsement '
                  'or approval of the linking party and its products and/or'
                  ' services; and (c) fits within the context of the linking'
                  ' party’s site.',
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const ContentOfTermsAndCondition(
              title: 'We may consider and approve other link'
                  ' requests from the following types of organizations:',
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const ContentOfTermsAndCondition(
              title:
                  '▪️commonly-known consumer and/or business information sources;',
            ),
            const ContentOfTermsAndCondition(
              title: '▪️dot.com community sites;',
            ),
            const ContentOfTermsAndCondition(
              title: '▪️associations or other groups representing charities;',
            ),
            const ContentOfTermsAndCondition(
              title: '▪️online directory distributors;',
            ),
            const ContentOfTermsAndCondition(
              title: '▪️internet portals;',
            ),
            const ContentOfTermsAndCondition(
              title: '▪️accounting, law and consulting firms; and',
            ),
            const ContentOfTermsAndCondition(
              title: '▪️educational institutions and trade associations.',
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const ContentOfTermsAndCondition(
              title: 'We will approve link requests from these'
                  ' organizations if we decide that: (a) the '
                  'link would not make us look unfavorably to ourselves '
                  'or to our accredited businesses; (b) the organization'
                  ' does not have any negative records with us; (c) the'
                  ' benefit to us from the visibility of the hyperlink'
                  ' compensates the absence of PHONIX; and (d) the link'
                  ' is in the context of general resource information.',
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const ContentOfTermsAndCondition(
              title: 'These organizations may link to our App so long as'
                  ' the link: (a) is not in any way deceptive; (b) does not'
                  ' falsely imply sponsorship, endorsement or approval of the'
                  ' linking party and its products or services; and (c)'
                  ' fits within the context of the linking party’s site.',
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const ContentOfTermsAndCondition(
              title: 'If you are one of the organizations listed in paragraph'
                  ' 2 above and are interested in linking to our App, you'
                  ' must inform us by sending an e-mail to PHONIX. Please'
                  ' include your name, your organization name, contact'
                  ' information as well as the URL of your site, a list'
                  ' of any URLs from which you intend to link to our App,'
                  ' and a list of the URLs on our site to which you would'
                  ' like to link. Wait 2-3 weeks for a response.',
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const ContentOfTermsAndCondition(
              title:
                  'Approved organizations may hyperlink to our App as follows:',
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const ContentOfTermsAndCondition(
              title: '▪️By use of our corporate name; or',
            ),
            const ContentOfTermsAndCondition(
              title:
                  '▪️By use of the uniform resource locator being linked to; or',
            ),
            const ContentOfTermsAndCondition(
              title: '▪️By use of any other description of our App being'
                  ' linked to that makes sense within the context and '
                  'format of content on the linking party’s site.',
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const ContentOfTermsAndCondition(
              title: 'No use of PHONIX\'s logo or other artwork will'
                  ' be allowed for linking absent a '
                  'trademark license agreement.',
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const TiteleOfTermsAndConditon(title: 'iFrames'),
            SizedBox(
              height: size.height * 0.01,
            ),
            const ContentOfTermsAndCondition(
              title: 'Without prior approval and written permission,'
                  ' you may not create frames around our Webpages'
                  ' that alter in any way the visual presentation or'
                  ' appearance of our App.',
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const TiteleOfTermsAndConditon(title: 'Content Liability'),
            SizedBox(
              height: size.height * 0.02,
            ),
            const ContentOfTermsAndCondition(
              title: 'We shall not be hold responsible for any'
                  ' content that appears on your App. You agree'
                  ' to protect and defend us against all claims'
                  ' that is rising on our App. No link(s) should '
                  'appear on any Website that may be interpreted as '
                  'libelous, obscene or criminal, or which infringes,'
                  ' otherwise violates, or advocates the infringement or'
                  ' other violation of, any third party rights.',
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const TiteleOfTermsAndConditon(
              title: 'Your Privacy',
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const ContentOfTermsAndCondition(
              title: 'Please read Privacy Policy.',
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const TiteleOfTermsAndConditon(
              title: 'Reservation of Rights',
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const ContentOfTermsAndCondition(
              title: 'We reserve the right to request that you remove all '
                  'links or any particular link to our App. You approve '
                  'to immediately remove all links to our App upon request.'
                  ' We also reserve the right to amen these terms and conditions'
                  ' and it’s linking policy at any time. By continuously linking'
                  ' to our App, you agree to be bound to and follow these'
                  ' linking terms and conditions.',
            ),
            const TiteleOfTermsAndConditon(
              title: 'Removal of links from our App',
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const ContentOfTermsAndCondition(
              title: 'If you find any link on our App that is'
                  ' offensive for any reason, you are free'
                  ' to contact and inform us any moment.'
                  ' We will consider requests to remove links'
                  ' but we are not obligated to or so or to '
                  'respond to you directly.',
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const ContentOfTermsAndCondition(
              title: 'We do not ensure that the information'
                  ' on this website is correct, we do not warrant'
                  ' its completeness or accuracy; nor do we promise'
                  ' to ensure that the website remains available or'
                  ' that the material on the website is kept up to date.',
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            const TiteleOfTermsAndConditon(title: 'Disclaimer'),
            SizedBox(
              height: size.height * 0.02,
            ),
            const ContentOfTermsAndCondition(
              title: 'To the maximum extent permitted by applicable law,'
                  ' we exclude all representations, warranties and conditions '
                  'relating to our App and the use of this website. Nothing in this'
                  ' disclaimer will:',
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const ContentOfTermsAndCondition(
              title: '▪️limit or exclude our or your liability '
                  'for death or personal injury;',
            ),
            const ContentOfTermsAndCondition(
              title: '▪️limit or exclude our or your'
                  ' liability for fraud or fraudulent misrepresentation;',
            ),
            const ContentOfTermsAndCondition(
              title: '▪️limit any of our or your liabilities in any way that'
                  ' is not permitted under applicable law; or',
            ),
            const ContentOfTermsAndCondition(
              title: '▪️exclude any of our or your liabilities that may not '
                  'be excluded under applicable law.',
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const ContentOfTermsAndCondition(
              title: 'The limitations and prohibitions of liability'
                  ' set in this Section and elsewhere in this'
                  ' disclaimer: (a) are subject to the'
                  ' preceding paragraph; and (b)'
                  ' govern all liabilities arising under the disclaimer'
                  ', including liabilities arising in contract,'
                  ' in tort and for breach of'
                  ' statutory duty.',
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const ContentOfTermsAndCondition(
              title: 'As long as the website and the information'
                  ' and services on the website are provided'
                  ' free of charge, we will not'
                  ' be liable for any loss'
                  ' or damage of any nature.',
            )
          ],
        ),
      ),
    );
  }
}

class TiteleOfTermsAndConditon extends StatelessWidget {
  const TiteleOfTermsAndConditon({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xff394285),
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class ContentOfTermsAndCondition extends StatelessWidget {
  const ContentOfTermsAndCondition({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xff394285),
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

// class ListItemsInTermsAndContion extends StatelessWidget {
//   const ListItemsInTermsAndContion({super.key, required this.title});
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         CircleAvatar(
//           backgroundColor: Color(0xff394285),
//           radius: 5,
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         Expanded(
//           child: ContentOfTermsAndCondition(
//             title: title,
//           ),
//         ),
//       ],
//     );
//   }
// }

// ContentOfTermsAndCondition(title: title) ,

// const 
//         const SizedBox(
//           width: 10,
//         ),
        


        // CircleAvatar(
        //   backgroundColor: Color(0xff394285),
        //   radius: 5,
        // ),